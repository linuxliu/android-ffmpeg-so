LOCAL_PATH := $(call my-dir)
subdirs := $(addprefix $(LOCAL_PATH)/,$(addsuffix /Android.mk, \
		librtmp \
	))
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
openssl=openssl-armv7a
else ifeq ($(TARGET_ARCH_ABI),x86)
openssl=openssl-x86
else ifeq ($(TARGET_ARCH_ABI),armeabi)
openssl=openssl-armv5
else ifeq ($(TARGET_ARCH_ABI),x86_64)
openssl=openssl-x86_64
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
openssl=openssl-arm64
endif
SSL :=$(LOCAL_PATH)/../build/$(openssl)/output
ifndef SSL
$(error "You must define SSL before starting")
endif

include $(subdirs)