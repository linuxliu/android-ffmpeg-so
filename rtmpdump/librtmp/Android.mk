LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := _ssl
LOCAL_SRC_FILES := $(SSL)/lib/libssl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := _crypto
LOCAL_SRC_FILES := $(SSL)/lib/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(NDK_PROJECT_PATH)/librtmp \
	$(SSL)/include
 
LOCAL_SRC_FILES:= \
	amf.c \
	hashswf.c \
	log.c \
	parseurl.c \
	rtmp.c
 
LOCAL_CFLAGS += -I$(SSL)/include -DUSE_OPENSSL
LOCAL_STATIC_LIBRARIES += _ssl _crypto
LOCAL_LDLIBS += -lz
LOCAL_MODULE := librtmp
include $(BUILD_STATIC_LIBRARY)