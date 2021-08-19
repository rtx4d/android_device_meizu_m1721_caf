# Copyright (C) 2021 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/meizu/m1721

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_SUFFIX := _64

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := false

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := \
	$(DEVICE_PATH)/bluetooth

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true

# Build
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TARGET_HW_DISK_ENCRYPTION_PERF := true

# Device Properties
TARGET_ODM_PROP := \
	$(DEVICE_PATH)/configs/props/odm.prop
TARGET_PRODUCT_PROP := \
	$(DEVICE_PATH)/configs/props/product.prop
TARGET_SYSTEM_PROP := \
	$(DEVICE_PATH)/configs/props/system.prop
TARGET_VENDOR_PROP := \
	$(DEVICE_PATH)/configs/props/vendor.prop

# Display
TARGET_SCREEN_DENSITY := 420

TARGET_USES_ION := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_COLOR_METADATA := true

# HIDL
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/manifest.xml

DEVICE_MATRIX_FILE += \
    device/qcom/common/compatibility_matrix.xml

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_SYMLINKS := \
	/vendor/dsp:/dsp \
	/vendor/firmware_mnt:/firmware \
	/mnt/vendor/persist:/persist
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Kernel
TARGET_KERNEL_CONFIG := ../m1721_defconfig
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := \
	androidboot.hardware=qcom \
	msm_rtb.filter=0x237 \
	ehci-hcd.park=3 \
	lpm_levels.sleep_disabled=1 \
	androidboot.bootdevice=7824900.sdhci \
	earlycon=msm_serial_dm,0x78af000 \
	androidboot.usbconfigfs=true \
	loop.max_part=7 \
	androidboot.selinux=permissive

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE :=  2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/meizu/m1721
TARGET_KERNEL_VERSION := 4.9

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION = 4.0
TARGET_NO_RPC := true
$(call inherit-product-if-exists, hardware/qcom/gps/gps_vendor_product.mk)

# OTA
TARGET_OTA_ASSERT_DEVICE := m1721

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # 25765059584 - 16384
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Recovery
TARGET_RECOVERY_FSTAB := \
	$(DEVICE_PATH)/init/fstab.recovery.qcom

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += \
	$(DEVICE_PATH)/sepolicy/vendor

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current