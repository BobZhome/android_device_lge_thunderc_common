#$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc/overlay

TARGET_PREBUILT_KERNEL := device/lge/thunderc/files/zImage
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
    libmm-omxcore \
    libOmxCore \
    brcm_patchram_plus \
    gps.thunderc \
    libaudio.thunderc \
    liba2dp \
    flash_image \
    dump_image \
    erase_image \
    FM \
    hcitool \
    libOmxVidEnc \
    libmm-omxcore



# GPS
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/libloc_api.so:system/lib/libloc_api.so \
    vendor/lge/thunderc/files/system/lib/libgps.so:system/lib/libgps.so \
    vendor/lge/thunderc/files/system/lib/libloc.so:system/lib/libloc.so \
    vendor/lge/thunderc/files/system/lib/libloc.so:obj/lib/libloc.so \
    vendor/lge/thunderc/files/system/lib/libcommondefs.so:system/lib/libcommondefs.so \
    vendor/lge/thunderc/files/system/lib/libloc-rpc.so:system/lib/libloc-rpc.so \


# Backlight
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/hw/lights.thunderc.so:system/lib/hw/lights.thunderc.so \

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    vendor/lge/thunderc/files/system/usr/keylayout/thunder.kl:system/usr/keylayout/thunder.kl \
    vendor/lge/thunderc/files/system/usr/keychars/thunder.kcm.bin:system/usr/keychars/thunder.kcm.bin \
    device/lge/thunderc/files/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    vendor/lge/thunderc/files/system/usr/keychars/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

# Board-specific init (does not support charging in "power off" state yet)
PRODUCT_COPY_FILES += \
    device/lge/thunderc/files/init.thunderc.rc:root/init.thunderc.rc \
    device/lge/thunderc/files/ueventd.thunderc.rc:root/ueventd.thunder.rc \
    device/lge/thunderc/files/initlogo.rle:root/initlogo.rle \
    device/lge/thunderc/files/chargerlogo:root/chargerlogo \
    device/lge/thunderc/files/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    device/lge/thunderc/files/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    device/lge/thunderc/files/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    device/lge/thunderc/files/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    device/lge/thunderc/files/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    device/lge/thunderc/files/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    device/lge/thunderc/files/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    device/lge/thunderc/files/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    device/lge/thunderc/files/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    device/lge/thunderc/files/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    device/lge/thunderc/files/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    device/lge/thunderc/files/chargerimages/battery_notenough.rle:root/chargerimages/battery_notenough.rle \
    device/lge/thunderc/files/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    device/lge/thunderc/files/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    device/lge/thunderc/files/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    device/lge/thunderc/files/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_02.rle \

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/thunderc/files/system/lib/hw/gralloc.thunderc.so:system/lib/hw/gralloc.thunderc.so \
    vendor/lge/thunderc/files/system/lib/hw/copybit.thunderc.so:system/lib/hw/copybit.thunderc.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/hw/sensors.thunderc.so:system/lib/hw/sensors.thunderc.so \
    vendor/lge/thunderc/files/system/bin/ami304d:system/bin/ami304d \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderc/files/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderc/files/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderc/files/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderc/files/system/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderc/files/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderc/files/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    device/lge/thunderc/files/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderc/files/system/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderc/files/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/thunderc/files/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderc/files/tun.ko:system/lib/modules/tun.ko \
    vendor/lge/thunderc/files/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/thunderc/files/system/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderc/files/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/thunderc/files/system/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderc/files/system/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderc/files/system/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
#    vendor/lge/thunderc/files/system/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/thunderc/files/system/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/lge/thunderc/files/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/bin/qmuxd:system/bin/qmuxd \

# Sprint MMS
PRODUCT_COPY_FILES += \
    device/lge/thunderc/files/apns-conf.xml:system/etc/apns-conf.xml \

# wipeirface (What is this?)
# (Whatever it is LS670 doesn't have it)
# PRODUCT_COPY_FILES += \
#    vendor/lge/thunderc/files/system/bin/wiperiface:system/bin/wiperiface \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/bin/tsdown:system/bin/tsdown \
    vendor/lge/thunderc/files/system/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \

# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/thunderc/files/system/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/thunderc/files/system/lib/libnetmgr.so:system/lib/libnetmgr.so


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderc/files/system/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderc/files/system/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderc/files/system/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderc/files/system/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderc/files/system/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderc/files/system/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderc/files/system/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderc/files/system/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderc/files/system/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderc/files/system/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderc/files/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderc/files/system/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderc/files/system/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderc/files/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderc/files/system/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderc/files/system/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderc/files/system/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderc/files/system/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderc/files/system/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/thunderc/files/system/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderc/files/system/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderc/files/system/lib/libril.so:system/lib/libril.so \
    vendor/lge/thunderc/files/system/bin/rild:system/bin/rild \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderc/files/system/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderc/files/system/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderc/files/system/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderc/files/system/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderc/files/system/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderc/files/system/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderc/files/system/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderc/files/system/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
#   vendor/lge/thunderc/files/system/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderc/files/system/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderc/files/system/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/system/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd \
    vendor/lge/thunderc/files/system/bin/btld:system/bin/btld \
    vendor/lge/thunderc/files/system/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    vendor/lge/thunderc/files/system/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    vendor/lge/thunderc/files/system/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    vendor/lge/thunderc/files/system/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    vendor/lge/thunderc/files/system/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \

PRODUCT_COPY_FILES += \
    device/lge/thunderc/files/mvdalvik.sh:system/etc/init.d/01mvdalvik \


$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_thunderc
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LS670
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderc

PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.clientidbase=android-sprint-us \
        ro.com.google.locationfeatures=1 \
        ro.cdma.home.operator.numeric=310120 \
        ro.cdma.home.operator.alpha=Sprint \
        ro.setupwizard.enable_bypass=1 \
	gsm.sim.operator.alpha=Sprint \
	gsm.sim.operator.numeric=310120 \
	gsm.sim.operator.iso-country=us \
	gsm.operator.alpha=Sprint \
	gsm.operator.numeric=310120 \
	gsm.operator.iso-country=us

