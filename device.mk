#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/haydn/haydn-vendor.mk)

# Call the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/haydn-miuicamera/products/miuicamera.mk)

# Moto Dolby
$(call inherit-product-if-exists, vendor/moto/dolby/config.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong

# API level
PRODUCT_SHIPPING_API_LEVEL := 30

# APNs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl:32 \
    android.hardware.audio.effect@6.0-impl:32 \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.3-impl

PRODUCT_PACKAGES += \
    audioadsprpcd \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libtinycompress

PRODUCT_PACKAGES += \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
    libqcomvisualizer \
    libsndmonitor \
    libspkrprot \
    libvolumelistener

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_io_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/bluetooth_qti_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_hearing_aid_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_platform_info.xml

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    libbthost_if

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.1-impl \
    com.dsi.ant@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Call recording for Google Dialer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64

PRODUCT_PACKAGES += \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Device-specific settings
PRODUCT_PACKAGES += \
    XiaomiParts

#Remove Unstuff Packages
PRODUCT_PACKAGES += \
   RemovePackages 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-parts.xml

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor

PRODUCT_PACKAGES += \
    gralloc.default \
    memtrack.default 

# WiFi Display
PRODUCT_PACKAGES += \
    libavservices_minijail_32 \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libdisplayconfig.system.qti \
    libnl \
    libqdMetaData \
    libqdMetaData.system \
    libwfdaac_vendor

PRODUCT_PACKAGES += \
    vendor.display.config@1.15.vendor \
    vendor.display.config@2.0.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/display_id_4630946736638489730.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946736638489730.xml \
    $(LOCAL_PATH)/configs/display/snapdragon_color_libs_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/snapdragon_color_libs_config.xml

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.haydn

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/charger_fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/charger_fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti

PRODUCT_PACKAGES += \
    libbatching \
    libgeofencing \
    libgnss \

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gnss_antenna_info.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf

PRODUCT_PACKAGES += \
    gnss@2.0-base.policy \
    gnss@2.0-xtra-daemon.policy

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Graphics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    IFAAService

# Init scripts
PRODUCT_PACKAGES += \
    init.mi_thermald.rc \
    init.uclamp.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.usb.rc \
	$(LOCAL_PATH)/rootdir/etc/init.qti.kernel.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qti.kernel.rc \
    $(LOCAL_PATH)/rootdir/etc/init.target.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.target.rc \
	$(LOCAL_PATH)/rootdir/etc/init.qcom.power.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.power.rc \
	$(LOCAL_PATH)/rootdir/etc/init.power.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.power.rc \
    $(LOCAL_PATH)/rootdir/bin/init.sensors_fix.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.sensors_fix.sh
		
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.kernel.post_boot-lahaina.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.kernel.post_boot-lahaina.sh \
    $(LOCAL_PATH)/rootdir/bin/init.qcom.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/bin/vendor_modprobe.sh:$(TARGET_COPY_OUT_VENDOR)/bin/vendor_modprobe.sh

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor
	
# Codec2
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.0.vendor \
    android.hardware.media.c2@1.1.vendor \
    libcodec2_vndk.vendor

# Media
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libstagefright_omx \
    libstagefright_foundation

# Minijail
PRODUCT_PACKAGES += \
    libavservices_minijail_vendor

# Network
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_RF.conf

# Platform
TARGET_BOARD_PLATFORM := lahaina

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Preopt SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QMI
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect.vendor

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.haydn-multihal \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi \
    hardware/qcom/display \
    hardware/qcom/media \
    vendor/qcom/opensource/audio-hal/primary-hal

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    av \
    bt \
    nq-nfc \
    display \
    media \
    perf \
    wfd \
    telephony

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.secure_element@1.2.vendor

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigOverlay \
    FrameworksResOverlayHaydn \
    P404HaydnSystemUI \
    SettingsProviderOverlayHaydn \
    SettingsResHaydn \
    TelephonyResCommon \
    WifiOverlay \

PRODUCT_PACKAGES += \
    HaydnCNSettingsProvider \
    HaydnCNWifiOverlay \
    HaydnGLSettingsProvider \
    HaydnGLWifiOverlay \
    HaydnProSettingsProvider \
    HaydnProWifiOverlay \

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0 \
    android.hardware.thermal@2.0-service.qti

# Uevent
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service-qti

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# Verified boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.haydn

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VNDK
PRODUCT_PACKAGES += \
    vndservicemanager \
    libvndksupport \
    libvndksupport.vendor

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    WifiOverlay \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor

# FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

