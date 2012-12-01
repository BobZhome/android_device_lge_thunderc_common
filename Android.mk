# HACK for prebuilt libril and libcamera
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libril_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libril_intermediates/export_includes)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/export_includes)

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),thunderc)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
