# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# Kernel
TARGET_KERNEL_SOURCE := /media/8fc04225-698c-4f95-bfa0-09e7cbddcf4f/home/bobzhome/android/ics/lg/GingerKernel-thunderc
TARGET_KERNEL_CONFIG := 1chaos_defconfig
#TARGET_PREBUILT_KERNEL := device/lge/VM670/kernels/BobZ/zImage
TARGET_SPECIFIC_HEADER_PATH := device/lge/common/include

# Fix this up by examining /proc/mtd on a running device
BOARD_KERNEL_BASE := 0x12200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00700000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xE600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0b2e0000
BOARD_FLASH_BLOCK_SIZE := 131072

#Platform
TARGET_BOARD_PLATFORM := thunderc
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27

#CPU
TARGET_ARCH := arm
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_FORCE_CPU_UPLOAD := true

#Boot and Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_HAS_NO_SELECT_BUTTON := true

#Camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
TARGET_DISABLE_ARM_PIE := true
BOARD_CAMERA_USE_MM_HEAP := true

#Audio & Bluetooth
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := false
BOARD_COMBO_DEVICE_SUPPORTED := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

#Wifi
BOARD_WLAN_DEVICE               := bcm4325
BOARD_WEXT_NO_COMBO_SCAN        := true
BOARD_WPA_SUPPLICANT_DRIVER     := WEXT
WIFI_DRIVER_HAS_LGE_SOFTAP      := true
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG          := "firmware_path=/etc/wl/rtecdc.bin nvram_path=/etc/wl/nvram.txt config_path=/data/misc/wifi/config"
WIFI_DRIVER_MODULE_NAME         := "wireless"
WIFI_DRIVER_FW_PATH_STA         := "/system/etc/wl/rtecdc.bin"
WIFI_DRIVER_FW_PATH_AP          := "/system/etc/wl/rtecdc-apsta.bin"
WPA_SUPPLICANT_VERSION          := VER_0_6_X

#Qualcomm Related
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_PROVIDES_LIBLIGHTS := true

#GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

#JIT
WITH_JIT := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Use the custom lights libs
TARGET_PROVIDES_LIBLIGHTS := true
BOARD_SYSFS_LIGHT_SENSOR := "/sys/devices/platform/i2c-gpio.2/i2c-2/2-0060/leds/lcd-backlight/als"

#Enable OpenGL Hardware Acceleration
#msm7x27: no support for overlay, bypass, or c2d
USE_OPENGL_RENDERER := true
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := false
TARGET_NO_HW_VSYNC := true
TARGET_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_USE_SKIA_LCDTEXT := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

# RIL
BOARD_PROVIDES_LIBRIL := true

#TouchScreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

#Mass Storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_CUSTOM_USB_CONTROLLER := ../../vendor/lge/thunderc/proprietary/VM670/UsbController.cpp
BOARD_EGL_CFG := vendor/lge/thunderc/proprietary/VM670/system/lib/egl/egl.cfg
BOARD_CUSTOM_BRCM_PATCHRAM_PLUS := vendor/lge/thunderc/proprietary/VM670/brcm_patchram_plus.c

# Offline Charging
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"rs"' -DBOARD_CHARGING_CMDLINE_VALUE='"c"'
