#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_KERNEL_PATH := device/xiaomi/ingres-kernel

TARGET_KERNEL_SOURCE := kernel/xiaomi/sm8450
TARGET_KERNEL_CONFIG := vendor/waipio_GKI.config vendor/ingres_GKI.config

BOARD_KERNEL_BINARIES := kernel
TARGET_FORCE_PREBUILT_KERNEL := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_KERNEL_PATH)/prebuilts/dtbo.img
TARGET_PREBUILT_KERNEL := $(DEVICE_KERNEL_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_KERNEL_PATH)/prebuilts/dtb.img

PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_DTB):$(TARGET_COPY_OUT)/dtb.img \
    $(TARGET_PREBUILT_KERNEL):kernel \
    $(call find-copy-subdir-files,*,$(DEVICE_KERNEL_PATH)/ramdisk-modules/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_KERNEL_PATH)/vendor-modules/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules)
