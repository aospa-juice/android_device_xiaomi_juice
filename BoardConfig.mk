#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/juice
COMMON_PATH := device/qcom/common

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Audio
TARGET_PROVIDES_AUDIO_EXTNS := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true

# Build Hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_DUP_SYSPROP := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API := true

# Metadata
BOARD_USES_METADATA_PARTITION := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := lime,citrus,lemon,pomelo,juice

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/configs/vintf/framework_compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_juice
TARGET_RECOVERY_DEVICE_MODULES := libinit_juice

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=default
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_IMAGE_NAME  := Image
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_TAGS_OFFSET        := 0x00000100

BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)-kernel/dtb.img

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 16777216
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114553663488
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184

BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 419430400
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 419430400
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 419430400
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 30720000

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Platform
BOARD_VENDOR := xiaomi

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/properties/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# QC tree common
TARGET_SEPOLICY_DIR := bengal

# Screen density
TARGET_SCREEN_DENSITY := 440

# Security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_F2FS := true

# Sensor multi HAL
USE_SENSOR_MULTI_HAL := true

# Sepolicy
#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
#BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/public
#BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
SELINUX_IGNORE_NEVERALLOWS := true

# Treble flag
BOARD_VNDK_VERSION := current

# WiFi
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
QC_WIFI_HIDL_FEATURE_DUAL_AP := true

# Inherit from the proprietary version
include vendor/xiaomi/juice/BoardConfigVendor.mk
