$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

SUB_MODEL := VM670

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/root/init.thunderc.rc:root/init.thunderc.rc \
    $(LOCAL_PATH)/root/init.thunderc.usb.rc:root/init.thunderc.usb.rc \
    $(LOCAL_PATH)/root/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/root/ueventd.thunderc.rc:root/ueventd.thunderc.rc

PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keylayout/thunderc_keypad.kl:system/usr/keylayout/thunderc_keypad.kl \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/keychars/thunderc_keypad.kcm.bin:system/usr/keychars/thunderc_keypad.kcm.bin

# configs
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/adreno_config.txt:system/etc/adreno_config.txt \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/vold.fstab:system/etc/vold.fstab \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/usr/idc/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderc/proprietary/$(SUB_MODEL)/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Audio
PRODUCT_PACKAGES += \
    audio_policy.thunderc \
    audio.primary.thunderc \
    audio.a2dp.default \
    libaudioutils

# Camera
PRODUCT_PACKAGES += \
    camera.thunderc

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libopencorehw \
    gralloc.thunderc \
    copybit.thunderc \
    hwcomposer.thunderc \
    dexpreopt

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    audio.usb.default \
    gps.default \
    lights.thunderc \
    lgapversion

# OMX
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# BT startup
PRODUCT_COPY_FILES += vendor/lge/thunderc/proprietary/$(SUB_MODEL)/init.qcom.bt.sh:system/bin/init.qcom.bt.sh
PRODUCT_PACKAGES += \
    hcitool \
    hciconfig \
    hwaddrs \
    bdaddr_read

PRODUCT_PACKAGES += \
    libjni_latinime \
    librs_jni \
    brcm_patchram_plus \
    bash \
    nano \
    flash_image \
    erase_image \
    dump_image

PRODUCT_PACKAGES += \
    Provision \
    GoogleSearch \
    QuickSearchBox \
    FileManager

# Offmode charging
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

DEVICE_PACKAGE_OVERLAYS += device/lge/common/overlay
