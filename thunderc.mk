DEVICE_PACKAGE_OVERLAYS += device/lge/thunderc_common/overlay/common 

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

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/thunderc_common/files/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/thunderc_common/files/usr/keylayout/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \

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

# GPS
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

$(call inherit-product, build/target/product/full.mk)

# We don't need to pull in the languages_full.mk manually because it'll get clobbered anyhow by full.mk
# mdpi goes last so that the janky default locale/region code can pick a sane default
PRODUCT_LOCALES += mdpi

PRODUCT_NAME := full_thunderc
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MANUFACTURER := LGE

#ifeq ($(SUB_MODEL),VS660)
#    # We're on Verizon (TODO)
#    CDMA_GOOGLE_BASE := android-verizon
#    CDMA_CARRIER_ALPHA := Verizon_Wireless
#    CDMA_CARRIER_NUMERIC := 310012
#endif

#ifeq ($(SUB_MODEL),LS670)
#    # We're on Sprint
#    CDMA_GOOGLE_BASE := android-sprint-us
#    CDMA_CARRIER_ALPHA := Sprint
#    CDMA_CARRIER_NUMERIC := 310120
#    BLUETOOTH_FIRMWARE := BCM4325D1_004.002.004.0218.0248.hcd
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

#ifeq ($(SUB_MODEL),MS690)
#    # We're on MetroPCS (TODO)
#    CDMA_GOOGLE_BASE := android-metropcs-us
#    CDMA_CARRIER_ALPHA := MetroPCS
#    CDMA_CARRIER_NUMERIC := 311660
#    BLUETOOTH_FIRMWARE := BCM4325D1_004.002.004.0285.0288.hcd
#endif
