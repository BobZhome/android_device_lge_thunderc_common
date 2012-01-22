/*
 * Copyright (C) 2008 The Android Open Source Project
 * Copyright (C) 2012 Tom Marshall, Alex Zepeda
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Modifications to bootlogo for the IHO project by Tom Marshall and Alex Zepeda.
 *
 * Currently this will search for appropriately named PNG and RLE image files and
 * display them.  This will catch files from any carrier, and any RLE or PNG files
 * with power_on_ in the filename.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>

#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/queue.h>

#include <linux/fb.h>
#include <linux/kd.h>
#include <linux/limits.h>

#include <cutils/memory.h>

#include <png.h>

#define BOOT_IMAGE_DIRECTORY "/bootimages"

int file_count = 0, raw_count = 0;

struct FB {
    unsigned short *bits;
    unsigned size;
    int fd;
    struct fb_fix_screeninfo fi;
    struct fb_var_screeninfo vi;
};

#define fb_width(fb) ((fb)->vi.xres)
#define fb_height(fb) ((fb)->vi.yres)
#define fb_size(fb) ((fb)->vi.xres * (fb)->vi.yres * 2)

static int fb_open(struct FB *fb)
{
    fb->fd = open("/dev/graphics/fb0", O_RDWR);
    if (fb->fd < 0)
        return -1;

    if (ioctl(fb->fd, FBIOGET_FSCREENINFO, &fb->fi) < 0)
        goto fail;
    if (ioctl(fb->fd, FBIOGET_VSCREENINFO, &fb->vi) < 0)
        goto fail;

    fb->bits = mmap(0, fb_size(fb), PROT_READ | PROT_WRITE,
                    MAP_SHARED, fb->fd, 0);
    if (fb->bits == MAP_FAILED)
        goto fail;

    return 0;

fail:
    close(fb->fd);
    return -1;
}

static void fb_close(struct FB *fb)
{
    munmap(fb->bits, fb_size(fb));
    close(fb->fd);
}

/* there's got to be a more portable way to do this ... */
static void fb_update(struct FB *fb)
{
    fb->vi.yoffset = 1;
    ioctl(fb->fd, FBIOPUT_VSCREENINFO, &fb->vi);
    fb->vi.yoffset = 0;
    ioctl(fb->fd, FBIOPUT_VSCREENINFO, &fb->vi);
}

static int vt_set_mode(int graphics)
{
    int fd, r;
    fd = open("/dev/tty0", O_RDWR | O_SYNC);
    if (fd < 0)
        return -1;
    r = ioctl(fd, KDSETMODE, (void*) (graphics ? KD_GRAPHICS : KD_TEXT));
    close(fd);
    return r;
}

/* 565RLE image format: [count(2 bytes), rle(2 bytes)] */

static int load_565rle_image(char *fn)
{
    struct FB fb;
    struct stat s;
    unsigned short *data, *bits, *ptr;
    unsigned count, max;
    int fd;

    if (vt_set_mode(1)) {
        return -1;
    }

    fd = open(fn, O_RDONLY);
    if (fd < 0) {
        goto fail_restore_text;
    }

    if (fstat(fd, &s) < 0) {
        goto fail_close_file;
    }

    data = mmap(0, s.st_size, PROT_READ, MAP_SHARED, fd, 0);
    if (data == MAP_FAILED)
        goto fail_close_file;

    if (fb_open(&fb))
        goto fail_unmap_data;

    max = fb_width(&fb) * fb_height(&fb);
    ptr = data;
    count = s.st_size;
    bits = fb.bits;
    while (count > 3) {
        unsigned n = ptr[0];
        if (n > max)
            break;
        android_memset16(bits, ptr[1], n << 1);
        bits += n;
        max -= n;
        ptr += 2;
        count -= 4;
    }

    munmap(data, s.st_size);
    fb_update(&fb);
    fb_close(&fb);
    close(fd);
    unlink(fn);
    return 0;

fail_unmap_data:
    munmap(data, s.st_size);
fail_close_file:
    close(fd);
fail_restore_text:
    vt_set_mode(0);
    return -1;
}

/* If we can't scan the directory for some reason
 * call this and just iterate through a predetermined
 * list of filenames and hope for the best
 */
void dump_all_images() {
    printf("Failed to  open directory\n");
    char fnbuf[80];
    int i;

    for (i = 0; i < 99; ++i) {
        snprintf(fnbuf, 80, "%s/power_on_%02d.rle", BOOT_IMAGE_DIRECTORY, i);
        if (load_565rle_image(fnbuf) != 0) {
            break;
        }
        usleep(100*1000);
    }
}


void scan_directory(DIR *directory, char (*array)[NAME_MAX]) {
    struct dirent *dent = NULL;

    int first_pass = (array == NULL);

    rewinddir(directory);
    file_count = 0;

    /* Scan the directory for potential boot images.  */
    while ((dent = readdir(directory))) {
        const int idx1 = strstr(dent->d_name, "power_on_")-dent->d_name;
        const int idx2 = strstr(dent->d_name, ".rle")-dent->d_name;
        const int idx3 = strstr(dent->d_name, ".png")-dent->d_name;
        const int ridx = strlen(dent->d_name)-4;
        if (first_pass) {
            if ((idx1 >= 0) && ((idx2 == ridx) || (idx3 == ridx))) {
                file_count++;
                printf("Found another file\n");
            }
            raw_count++;
        } else {
            if ((idx1 >= 0) && ((idx2 == ridx) || (idx3 == ridx))) {
                snprintf(array[file_count++], NAME_MAX, "%s/%s", BOOT_IMAGE_DIRECTORY, dent->d_name);
                printf("Found %s/%s\n", BOOT_IMAGE_DIRECTORY, dent->d_name);
            }
        }
    }
}

/* Based on http://zarb.org/~gc/html/libpng.html */
void display_png_image(const char *filename)
{
    unsigned int x, y;
    unsigned int width, height;
    png_byte color_type;

    png_structp png_ptr;
    png_infop info_ptr;
    png_bytep *row_pointers;

    char header[8];    // 8 is the maximum size that can be checked

    if (vt_set_mode(1)) {
        return;
    }

    /* open file and test for it being a png */
    FILE *fp = fopen(filename, "rb");
    if (!fp) {
        fprintf(stderr, "[bootlogo] %s could not be opened for reading\n", filename);
        goto fail_restore_text;
    }

    fread(header, 1, 8, fp);
    if (png_sig_cmp(header, 0, 8)) {
        fprintf(stderr, "[bootlogo] %s is not recognized as a PNG file\n", filename);
        goto fail_close_file;
    }


    /* initialize libpng */
    png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);

    if (!png_ptr) {
        fprintf(stderr, "[bootlogo] png_create_read_struct failed");
        goto fail_close_file;
    }

    info_ptr = png_create_info_struct(png_ptr);
    if (!info_ptr) {
        fprintf(stderr, "[bootlogo] png_create_info_struct failed\n");
        goto fail_close_file;
    }

    if (setjmp(png_jmpbuf(png_ptr))) {
        fprintf(stderr, "[bootlogo] Error during init_io\n");
        goto fail_close_file;
    }

    png_init_io(png_ptr, fp);
    png_set_sig_bytes(png_ptr, 8);

    png_read_info(png_ptr, info_ptr);

    width = png_get_image_width(png_ptr, info_ptr);
    height = png_get_image_height(png_ptr, info_ptr);
    color_type = png_get_color_type(png_ptr, info_ptr);

    /* read file */
    if (setjmp(png_jmpbuf(png_ptr))) {
        fprintf(stderr, "[bootlogo] Error during read_image\n");
        goto fail_close_file;
    }

    row_pointers = (png_bytep*) malloc(sizeof(png_bytep) * height);
    for (y = 0; y < height; y++) {
        row_pointers[y] = (png_byte*) malloc(png_get_rowbytes(png_ptr,info_ptr));
    }

    png_read_image(png_ptr, row_pointers);

    fclose(fp); fp = NULL;

    /* Clean up after libpng */
    //png_read_end(png_ptr, NULL);
    //png_destroy_read_struct(&png_ptr, &info_ptr, NULL);

    struct FB fb;
    if (fb_open(&fb)) {
      goto fail_restore_text;
    }

    const unsigned int max_width = fb_width(&fb);
    const unsigned int max_height = fb_height(&fb);

    switch (png_get_color_type(png_ptr, info_ptr)) {
        case PNG_COLOR_TYPE_RGB:
            break;
        case PNG_COLOR_TYPE_RGBA:
        default:
            fprintf(stderr, "%s is not an RGB input file\n", filename);
            goto fail_restore_text;
    }

    if ((height > max_height) || (width > max_width)) {
        fprintf(stderr, "[bootlogo] %s is too big, 320x480 max\n", filename);
        goto fail_restore_text;
    } else if ((height != max_height) || (width != max_width)) {
        fprintf(stderr, "[bootlogo] %s is not 320x480 (it is %dx%d - recoverable)\n", filename, width, height);
    }

    unsigned short *data_565 = fb.bits;

    for (y = 0; y < height; y++) {
        png_byte *row = row_pointers[y];
        for (x = 0; x < width; x++) {
            png_byte *ptr = &(row[x*3]);
            const unsigned int pixIndex = (y*max_width)+(x);
            android_memset16(data_565+pixIndex, ( ((((unsigned short) ptr[0]) & 0xF8U) << 8) | ((((unsigned short) ptr[1]) & 0xFCU) << 3) | (((unsigned short) ptr[2]) >> 3) ), 2);
        }
    }

    fb_update(&fb);
    fb_close(&fb);
    return;

// Should probably destroy the read sruct here...
fail_close_file:
    if (fp != NULL) {
        fclose(fp);
    }
fail_restore_text:
    vt_set_mode(0);
    return;
}

int main(int argc, char **argv)
{
    DIR *dir_fd = opendir(BOOT_IMAGE_DIRECTORY);

    /* If we can't read the directory, try it blind */
    if (!dir_fd) {
        dump_all_images();
        return 0;
    }

    scan_directory(dir_fd, NULL);

    char image_names[file_count][NAME_MAX];

    /* Rewind, and actually copy over the image names */
    scan_directory(dir_fd, image_names);
    closedir(dir_fd);

    qsort(image_names, file_count, NAME_MAX, strcmp);

    int i;
    for (i=0; i < file_count; i++) {
        const int idx_rle = strstr(image_names[i], ".rle")-image_names[i];
        const int idx_png = strstr(image_names[i], ".png")-image_names[i];

        if (idx_rle >= 0) {
            load_565rle_image(image_names[i]);
        } else if (idx_png >= 0) {
            display_png_image(image_names[i]);
        } // else we shouldn't be here...
        usleep(100*1000);
    }

    return 0;
}
