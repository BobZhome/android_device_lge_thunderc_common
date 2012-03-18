# Note: this needs to be called from the device specific thunderc_AANNN.mk file
# *AFTER* SUB_MODEL, CDMA_GOOGLE_BASE, CDMA_CARRIER_ALPHA, CDMA_CARRIER_NUMERIC,
# and BLUETOOTH_FIRMWARE have been defined.

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc_common/overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc_$(SUB_MODEL)/overlay

PRODUCT_PACKAGES += \
    gps.thunderc \
    librs_jni \
    libmm-omxcore \
    libOmxCore \
    bdaddr_read \
    flash_image \
    dump_image \
    erase_image \
    e2fsck \
    SpareParts \
    CMWallpapers \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers

DISABLE_DEXPREOPT := false

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Kernel
LOCAL_KERNEL := device/lge/thunderc_$(SUB_MODEL)/files/kernel/zImage
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Locate vendor bootimage files if present
# Because these are carrier specific, I've left the default to no logo.
BOOTIMAGE_FILES := $(wildcard device/lge/thunderc_$(SUB_MODEL)/files/bootimages/*.rle)

ifeq ($(BOOTIMAGE_FILES),)
  PRODUCT_COPY_FILES += \
      device/lge/thunderc_common/files/initlogo.rle:root/initlogo.rle
else
  PRODUCT_PACKAGES += bootlogo
  PRODUCT_COPY_FILES += \
      $(foreach f,$(BOOTIMAGE_FILES),$(f):root/bootimages/$(notdir $(f)))
endif

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/thunderc_common/files/usr/keylayout/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keychars/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/init.thunderc.rc:root/init.thunderc.rc \
    device/lge/thunderc_common/files/ueventd.thunderc.rc:root/ueventd.thunder.rc \
    device/lge/thunderc_common/files/etc/init.local.rc:/system/etc/init.local.rc

# Off-mode charging pieces
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/sbin/chargerlogo:root/sbin/chargerlogo \
    device/lge/thunderc_common/files/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    device/lge/thunderc_common/files/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    device/lge/thunderc_common/files/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    device/lge/thunderc_common/files/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    device/lge/thunderc_common/files/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    device/lge/thunderc_common/files/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    device/lge/thunderc_common/files/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    device/lge/thunderc_common/files/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    device/lge/thunderc_common/files/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    device/lge/thunderc_common/files/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    device/lge/thunderc_common/files/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    device/lge/thunderc_common/files/chargerimages/battery_notenough.rle:root/chargerimages/battery_notenough.rle \
    device/lge/thunderc_common/files/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    device/lge/thunderc_common/files/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    device/lge/thunderc_common/files/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    device/lge/thunderc_common/files/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_02.rle \

# GPS (this might be better off as device specific depending on how carriers have configured AGPS)
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/etc/loc_parameter.ini:system/etc/loc_parameter.ini \

# WiFi
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/thunderc_common/files/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \

# Audio
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/thunderc_common/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

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

PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/thunderc_common/files/etc/init.d/mvdalvik.sh:system/etc/init.d/01mvdalvik \

# Let's use our own GPS config file
PRODUCT_COPY_FILES += device/lge/thunderc_common/files/etc/gps.conf:system/etc/gps.conf

# Backlight
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/hw/lights.thunderc.so:system/lib/hw/lights.thunderc.so \

# 2D (using proprietary because of poor performance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/hw/gralloc.thunderc.so:system/lib/hw/gralloc.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/hw/copybit.thunderc.so:system/lib/hw/copybit.thunderc.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/hw/sensors.thunderc.so:system/lib/hw/sensors.thunderc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/ami304d:system/bin/ami304d \

# GPS
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libloc_api.so:system/lib/libloc_api.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libgps.so:system/lib/libgps.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libloc.so:system/lib/libloc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libloc.so:obj/lib/libloc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libcommondefs.so:system/lib/libcommondefs.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libloc-rpc.so:system/lib/libloc-rpc.so

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# WiFi
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libaudioeq.so:system/lib/libaudioeq.so \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/qmuxd:system/bin/qmuxd \
    
# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libril.so:system/lib/libril.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/rild:system/bin/rild \

# The Vortex doesn't seem to have this library.
ifneq ($(SUB_MODEL),VS660)
  PRODUCT_COPY_FILES += \
      vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/liblgerft.so:system/lib/liblgerft.so
endif

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

ifeq ($(SUB_MODEL),VS660)
  PRODUCT_COPY_FILES += \
      vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxCore.so:system/lib/libOmxCore.so \
      vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so
else
  PRODUCT_COPY_FILES += \
      vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
      vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so
endif

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/bin/$(BLUETOOTH_FIRMWARE):system/bin/BCM4325.hcd

$(call inherit-product, build/target/product/full.mk)

# We don't need to pull in the languages_full.mk manually because it'll get clobbered anyhow by full.mk
# mdpi goes last so that the janky default locale/region code can pick a sane default
PRODUCT_LOCALES += mdpi

PRODUCT_NAME := full_thunderc_$(SUB_MODEL)
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc_$(SUB_MODEL)
PRODUCT_MANUFACTURER := LGE

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

#ifeq ($(SUB_MODEL),VS660)
#    # We're on Verizon (TODO)
#    CDMA_GOOGLE_BASE := android-verizon
#    CDMA_CARRIER_ALPHA := Verizon_Wireless
#    CDMA_CARRIER_NUMERIC := 310012
#endif

#ifeq ($(SUB_MODEL),US670)
#    # We're on USC (TODO)
#    CDMA_GOOGLE_BASE := android-sprint-us
#    CDMA_CARRIER_ALPHA := US_Cellular
#    CDMA_CARRIER_NUMERIC := 310066
#endif

#ifeq ($(SUB_MODEL),LW690)
#    # We're on Cricket (In progress)
#    CDMA_GOOGLE_BASE := android-cricket-us
#    CDMA_CARRIER_ALPHA := Cricket
#    CDMA_CARRIER_NUMERIC := 310016
#    BLUETOOTH_FIRMWARE := BCM4325D1_004.002.004.0285.0301.hcd
#endif
