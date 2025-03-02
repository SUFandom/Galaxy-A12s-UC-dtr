#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a12s

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a15

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := exynos850
TARGET_NO_BOOTLOADER := true


# Display
TARGET_SCREEN_DENSITY := 300

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x10000000
# BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos850 androidboot.selinux=enforce loop.max_part=7
BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos850 androidboot.selinux=enforce loop.max_part=15 androidboot.usbconfigfs=true androidboot.usbcontroller=13600000.dwc3 
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := a12s_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a12s

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
# TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/MizuKerneLite-recovery1.1.xz # bad attempt lmao
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/MizuKerneLite-recovery-1.2
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 55574528
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 55574528
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_ext # system_dlkm vendor_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := universal3830

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
# BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# META
BOARD_USES_METADATA_PARTITION := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# TWRP Configuration by @SUFandom
TW_EXCLUDE_TWRPAPP := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TARGET_USERIMAGES_USE_F2FS := true
TW_DEVICE_VERSION := A12s_exp_@Mizumo_prjkt
TW_MTP_DEVICE := "Galaxy A12 TWRP"
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1500
TW_INCLUDE_NTFS_3G := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXTRA_LANGUAGES := false
TW_USE_NEW_MINADBD := true


# TheDarkDeath's Recommendation fix 

# TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
# TW_MAX_BRIGHTNESS := 300
# TW_DEFAULT_BRIGHTNESS := 155
# BOARD_SUPRESS_SECURE_ERASE := true
# BOARD_ROOT_EXTRA_FOLDERS += \
# 	cache \
# 	carrier \
# 	data_mirror \
# 	efs \
# 	keyrefuge \
# 	linkerconfig \
# 	metadata \
# 	omr \
# 	optics \
# 	bin \
# 	sys \
# 	prism
# TW_INCLUDE_REPACKTOOLS := true
# TW_INCLUDE_RESETPROP := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# TW_BACKUP_EXCLUSIONS += \
# 	/data/fonts \
# 	/data/system/package_cache \
# 	/data/dalvik=cache \
# 	/data/cache \
# 	/data/adb \
# 	/data/media/0 \
# 	/data/resource-cache \
# 	/data/gsi \
# 	/data/system/graphicsstats  

## Making the recovery.img smaller
# BOARD_HAS_NO_REAL_SDCARD := true  # making this flag obsolete
# RECOVERY_SDCARD_ON_DATA  := true

# Compress (special help with physwizz)
BOARD_RAMDISK_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery