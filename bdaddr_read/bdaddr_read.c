#include <fcntl.h>
#include <string.h>
#include <cutils/properties.h>
#include <cutils/log.h>
#include <stdlib.h>
#include <time.h>

#define LOG_TAG "bdaddr"
#define BDADDR_PATH "/data/bdaddr"
#define RND_BDADDR_PATH "/data/rnd_bdaddr"

/* Try to read bdaddr from RND_BDADDR_PATH
 * if RND_BDADDR_PATH does not exist create a randomized bdaddr
 * write it to BD_ADDR_PATH and set the service.brcm.bt.mac,
 * write bdaddr to BDADDR_PATH, and set ro.bt.bdaddr_path to BDADDR_PATH */

int main() {
    char tmpbdaddr[13];
    char bdaddr[18];
    int count;
    int fd;

    srand(time(NULL));
    if(access(RND_BDADDR_PATH, F_OK) == 0) {
        fd = open(RND_BDADDR_PATH, O_RDONLY);
            if(fd < 0) {
                fprintf(stderr, "open(%s) failed\n", RND_BDADDR_PATH);
                LOGE("Can't open %s\n", RND_BDADDR_PATH);
                return -2;
            }
        count = read(fd, tmpbdaddr, 12);
        if (count < 0) {
            fprintf(stderr, "read(%s) failed\n", RND_BDADDR_PATH);
                LOGE("Can't read %s\n", RND_BDADDR_PATH);
                return -2;
        } else if (count != 12) {
                fprintf(stderr, "read(%s) unexpected size %d", RND_BDADDR_PATH, 12);
                LOGE("unexpected size in %s\n", RND_BDADDR_PATH);
                return -2;
        }
        close(fd);
    } else {
        count = sprintf(tmpbdaddr, "B08991%02X%02X%02X\n", random() % 256, random() % 256, random() % 256);
        fd = open(RND_BDADDR_PATH, O_WRONLY|O_CREAT|O_TRUNC, 00600|00060|00006);
        if(fd < 0) {
            fprintf(stderr, "open(%s) failed\n", RND_BDADDR_PATH);
                LOGE("Can't open %s\n", RND_BDADDR_PATH);
                return -2;
        }
        write(fd, tmpbdaddr, 12);
        close(fd);
    }
 
    count = sprintf(bdaddr, "%02.2s:%02.2s:%02.2s:%02.2s:%02.2s:%02.2s\0",
    	                tmpbdaddr,tmpbdaddr+2,tmpbdaddr+4,tmpbdaddr+6,tmpbdaddr+8,tmpbdaddr+10);
    fd = open(BDADDR_PATH, O_WRONLY|O_CREAT|O_TRUNC, 00600|00060|00006);
    if(fd < 0) {
        fprintf(stderr, "open(%s) failed\n", BDADDR_PATH);
		LOGE("Can't open %s\n", BDADDR_PATH);
		return -2;
    }
    write(fd, bdaddr, 18);
    close(fd);
    property_set("ro.bt.bdaddr_path", BDADDR_PATH);
    return 0;
}