# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, vendor/meizu/m1721/m1721-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n.mk)

# Audio
PRODUCT_PACKAGES += \
	libaacwrapper

PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=6 \
	ro.vendor.audio.sdk.fluencetype=fluence \
	vendor.audio.feature.compr_voip.enable=true \
	vendor.audio.feature.compress_meta_data.enable=false \
	vendor.audio.feature.fm.enable=false \
	vendor.audio.feature.spkr_prot.enable=true \
	vendor.audio.safx.pbe.enabled=false \
	vendor.fastrpc.disable.adsprpcd_sensorspd.daemon=1

# Audio configuration
-include $(TOPDIR)hardware/qcom/audio/configs/msm8953/msm8953.mk

# Audio XML configuration files (For M6 Note)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
	$(LOCAL_PATH)/configs/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

# Audio XML configuration files (From BSP)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
	$(LOCAL_PATH)/configs/audio/audio_platform_info_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_mtp.xml

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.audio.service \
	android.hardware.bluetooth.audio@2.0-impl \
	audio.bluetooth.default \
	vendor.qti.hardware.btconfigstore@1.0.vendor \
	vendor.qti.hardware.btconfigstore@2.0.vendor

PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.qcom.bluetooth.soc=pronto \
	persist.vendor.qcom.bluetooth.enable.splita2dp=false \
	ro.bluetooth.hfp.ver=1.7 \
	ro.vendor.bluetooth.wipower=false

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml

# Bluetooth XML configuration files
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
	android.frameworks.displayservice@1.0_32 \
	android.hardware.camera.common@1.0 \
	android.hardware.camera.device@3.3:64 \
	android.hardware.camera.device@3.4:64 \
	android.hardware.camera.device@3.5:64 \
	android.hardware.camera.provider@2.4 \
	android.hardware.camera.provider@2.4-impl:32 \
	android.hardware.camera.provider@2.4-service \
	android.hardware.camera.provider@2.5:64 \
	android.hardware.camera.provider@2.6:64 \
	vendor.qti.hardware.camera.device@1.0 \
	camera.msm8953 \
	libcamshim \
	libmm-qcamera \
	libui_shim

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

# Display
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.composer@2.1-service \
	android.hardware.graphics.mapper@2.0-impl-2.1 \
	android.hardware.memtrack@1.0-impl \
	android.hardware.memtrack@1.0-service \
	gralloc.msm8953 \
	hwcomposer.msm8953 \
	memtrack.msm8953 \
	libvulkan \
	vendor.display.config@2.0

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.0-impl \
	android.hardware.drm@1.0-service \
	android.hardware.drm@1.3-service.clearkey

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.meizu_m1721

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \

# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.gatekeeper@1.0-service

# GPS
PRODUCT_PACKAGES += \
	libcurl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
	$(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
	$(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
	$(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
	$(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
	$(LOCAL_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.1-impl-qti \
	android.hardware.health@2.1-service

# IMS
PRODUCT_PACKAGES += \
	libnbaio

PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
	vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

PRODUCT_SYSTEM_EXT_PROPERTIES += \
	persist.vendor.dpm.loglevel=0

# Input
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/msm8953-snd-card-mtp_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/msm8953-snd-card-mtp_Button_Jack.kl

# IPC Security Config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_SYSTEM)/etc/sec_config

# Keymaster
PRODUCT_PACKAGES += \
	android.hardware.keymaster@4.0-impl \
	android.hardware.keymaster@4.0-service

# Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media/media_profiles_8953.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml \
	$(LOCAL_PATH)/configs/media/media_profiles_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8953.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_8953.xml \
	$(LOCAL_PATH)/configs/media/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_8953_v1.xml \
	$(LOCAL_PATH)/configs/media/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8953_v1.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_performance_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxSwVencHevc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libstagefright_enc_common

# Overlays
PRODUCT_PACKAGES += \
	MSM8953Bluetooth \
    MSM8953Tethering \
    m1721WiFi

# Power
PRODUCT_PACKAGES += \
	android.hardware.power-service-qti

# Powerhint configuration file
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/power/powerhint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/powerhint.xml

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# Public libraries
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QMI
PRODUCT_PACKAGES += \
	libjson

# QTI Common
PRODUCT_PACKAGES += \
	adreno-legacy \
	audio \
	av \
	bt \
	display \
	init \
	media-legacy \
	overlay \
	perf \	
	telephony \
	usb \
	vibrator\
	wfd \
	wlan

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.target.rc

# RenderScript HAL
PRODUCT_PACKAGES += \
	android.hardware.renderscript@1.0-impl

# RIL
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2 \
	librmnetctl

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_PACKAGES += \
	android.hardware.sensors@1.0-impl \
	android.hardware.sensors@1.0-service \
	libsensorndkbridge

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
	$(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Thermal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/thermal/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# VNDK
PRODUCT_PACKAGES += \
    vndk_package \
    libstdc++.vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    libcld80211 \
    libwpa_client \
    libqmiservices_shim

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_cfg.dat

# Include QCOM WLAN
-include device/qcom/wlan/sdm660_64/wlan.mk