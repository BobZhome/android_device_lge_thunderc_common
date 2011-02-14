#$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += vendor/lge/thunderc/overlay

TARGET_PREBUILT_KERNEL := vendor/lge/thunderc/kernel_test

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := vendor/lge/thunderc/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
	libmm-omxcore \
    libOmxCore \
    brcm_patchram_plus \
    libaudio.thunderc \
    gps.thunderc


# GPS
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/librpc.so:system/lib/librpc.so \
    vendor/lge/thunderc/files/lib/libloc_api.so:system/lib/libloc_api.so \
    vendor/lge/thunderc/files/lib/libgps.so:system/lib/libgps.so \
    vendor/lge/thunderc/files/lib/libloc.so:system/lib/libloc.so \
    vendor/lge/thunderc/files/lib/libloc.so:obj/lib/libloc.so \
    vendor/lge/thunderc/files/lib/libcommondefs.so:system/lib/libcommondefs.so \
    vendor/lge/thunderc/files/lib/libloc-rpc.so:system/lib/libloc-rpc.so \

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    vendor/lge/thunderc/files/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    vendor/lge/thunderc/files/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

# Board-specific init (does not support charging in "power off" state yet)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/init.thunderc.rc:root/init.thunderc.rc \
    vendor/lge/thunderc/files/initlogo.rle:root/initlogo.rle \
    vendor/lge/thunderc/files/ueventd.thunderc.rc:root/ueventd.thunderc.rc \
    vendor/lge/thunderc/files/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh \
#    vendor/lge/thunderc/files/fota.rc:root/fota.rc \
#    vendor/lge/thunderc/files/init.lge.hidden_reset.sh:root/init.lge.hidden_reset.sh \
#    vendor/lge/thunderc/files/chargerlogo:root/sbin/chargerlogo \
#    vendor/lge/thunderc/files/ftm_power:root/sbin/ftm_power \
#    vendor/lge/thunderc/files/bootlogo:root/sbin/bootlogo \
#    vendor/lge/thunderc/files/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
#    vendor/lge/thunderc/files/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
#    vendor/lge/thunderc/files/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
#    vendor/lge/thunderc/files/bootimages/opening_01.rle:root/bootimages/opening_01.rle \
#    vendor/lge/thunderc/files/bootimages/opening_02.rle:root/bootimages/opening_02.rle \
#    vendor/lge/thunderc/files/bootimages/opening_03.rle:root/bootimages/opening_03.rle \
#    vendor/lge/thunderc/files/bootimages/opening_04.rle:root/bootimages/opening_04.rle \
#    vendor/lge/thunderc/files/bootimages/opening_05.rle:root/bootimages/opening_05.rle \
#    vendor/lge/thunderc/files/bootimages/opening_06.rle:root/bootimages/opening_06.rle \
#    vendor/lge/thunderc/files/init.rc:root/init.rc \

# Backlight
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/hw/lights.thunderc.so:system/lib/hw/lights.thunderc.so \

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/thunderc/files/lib/hw/gralloc.thunderc.so:system/lib/hw/gralloc.thunderc.so \
    vendor/lge/thunderc/files/lib/hw/copybit.thunderc.so:system/lib/hw/copybit.thunderc.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/hw/sensors.thunderc.so:system/lib/hw/sensors.thunderc.so \
    vendor/lge/thunderc/files/bin/ami304d:system/bin/ami304d \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderc/files/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderc/files/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderc/files/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderc/files/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderc/files/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderc/files/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderc/files/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderc/files/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# Wifi
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    vendor/lge/thunderc/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/thunderc/files/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderc/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpd/dhcpcd.conf \
    vendor/lge/thunderc/files/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderc/files/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderc/files/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/thunderc/files/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/thunderc/files/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/lge/thunderc/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

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
    vendor/lge/thunderc/files/bin/port-bridge:system/bin/port-bridge \
    vendor/lge/thunderc/files/bin/qmuxd:system/bin/qmuxd \
    vendor/lge/thunderc/files/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    vendor/lge/thunderc/files/bin/rmt_storage:system/bin/rmt_storage \

# wipeirface (What is this?)
# (Whatever it is LS670 doesn't have it)
# PRODUCT_COPY_FILES += \
#    vendor/lge/thunderc/files/bin/wiperiface:system/bin/wiperiface \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/bin/tsdown:system/bin/tsdown \
    vendor/lge/thunderc/files/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \

# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/thunderc/files/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/thunderc/files/lib/libnetmgr.so:system/lib/libnetmgr.so


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderc/files/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderc/files/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderc/files/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderc/files/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderc/files/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderc/files/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderc/files/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderc/files/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderc/files/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderc/files/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderc/files/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderc/files/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderc/files/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderc/files/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderc/files/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderc/files/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderc/files/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderc/files/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderc/files/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/thunderc/files/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderc/files/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderc/files/lib/libril.so:system/lib/libril.so \
    vendor/lge/thunderc/files/bin/rild:system/bin/rild \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderc/files/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderc/files/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderc/files/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderc/files/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderc/files/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderc/files/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderc/files/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/thunderc/files/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderc/files/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderc/files/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderc/files/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderc/files/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderc/files/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderc/files/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/thunderc/files/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderc/files/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderc/files/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
#    vendor/lge/thunderc/files/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    vendor/lge/thunderc/files/lib/libqcomm_omx.so:system/lib/libqcomm_omx.so \
#    vendor/lge/thunderc/files/lib/libstagefright_omx.so:system/lib/libstagefright_omx.so \
#    vendor/lge/thunderc/files/lib/libopencore_common.so:system/lib/libopencore_common.so \
#    vendor/lge/thunderc/files/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/files/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd \
    vendor/lge/thunderc/files/bin/btld:system/bin/btld \
    vendor/lge/thunderc/files/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    vendor/lge/thunderc/files/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    vendor/lge/thunderc/files/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    vendor/lge/thunderc/files/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    vendor/lge/thunderc/files/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_thunderc
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LGLS670
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderc

PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.clientidbase=android-sprint-us \
        ro.com.google.locationfeatures=1 \
        ro.cdma.home.operator.numeric=310120 \
        ro.cdma.home.operator.alpha=Sprint \
        ro.setupwizard.enable_bypass=1 \
        ro.media.dec.jpeg.memcap=20000000 \
        dalvik.vm.lockprof.threshold=500

