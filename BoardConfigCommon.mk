# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

#Device Information
TARGET_ARCH := arm
TARGET_PROVIDES_INIT_TARGET_RC := true

#Platform
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

#CPU
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_FORCE_CPU_UPLOAD := true

#Boot and Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := thunderc

#Camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DFORCE_CPU_UPLOAD
# This is needed by libcamera.so 
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true 

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
HOSTAPD_VERSION			:= VER_0_6_X
BOARD_HOSTAPD_DRIVER            := bcm4325
#BOARD_HOSTAPD_PRIVATE_LIB       := lib_driver_cmd_wext
#BOARD_SOFTAP_DEVICE_TI          := bcm4325
#BOARD_P2P_DEVICE_TI             := bcm4325


#Qualcomm Related
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_CDMA_NETWORK := true

#GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := thunderc
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

#JIT
WITH_JIT := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true

#Enable OpenGL Hardware Acceleration
#msm7x27: no support for overlay, bypass, or c2d
USE_OPENGL_RENDERER := true
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

#TouchScreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

#Mass Storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/vold/179:1
BOARD_SDEXT_DEVICE := /dev/block/vold/179:2

#ICS settings
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27 -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DUSE_LGE_ALS_DUMMY

#ril
TARGET_PROVIDES_LIBRIL := true

#sensors
TARGET_USES_OLD_LIBSENSORS_HAL :=true
TARGET_HAS_FOXCONN_SENSORS :=false
BOARD_VENDOR_USE_AKMD := akm8973
TARGET_SENSORS_NO_OPEN_CHECK := true
TARGET_USES_OLD_LIBSENSORS_HAL := true
TARGET_WANTS_OLD_ACTIVATE_BEHAVIOR := true

#HAL
TARGET_OVERLAY_ALWAYS_DETERMINES_FORMAT := true
TARGET_SF_NEEDS_REAL_DIMENSIONS := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

#Skia
BOARD_USE_SKIA_LCDTEXT := true

#Misc
BOARD_HAS_NO_SELECT_BUTTON := true

#OFFLINE CHARGING
BOARD_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"lge.reboot"' -DBOARD_CHARGING_CMDLINE_VALUE='"pwroff"'
BOARD_USES_RECOVERY_CHARGEMODE := false
