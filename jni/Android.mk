LOCAL_PATH := $(call my-dir)

########################################################
## httptunnel client
########################################################
HTTPTUNNEL_SOURCE := \
        base64.c \
        common.c \
        htc.c \
        http.c \
        tunnel.c \
        port/daemon.c \
        port/endprotoent.c \
        port/getopt.c \
        port/getopt1.c \
        port/poll.c \
        port/vsnprintf.c \
        port/vsyslog.c

include $(CLEAR_VARS)
LOCAL_MODULE := htc
LOCAL_CFLAGS := -DHAVE_CONFIG_H -O2 -Wall -fomit-frame-pointer -fPIE 
LOCAL_LDFLAGS := -fPIE -pie
LOCAL_C_INCLUDES:= \
        $(LOCAL_PATH)/include \
        $(LOCAL_PATH)/include/httptunnel \
        $(LOCAL_PATH)/httptunnel/port \
        $(LOCAL_PATH)/httptunnel/port/sys
LOCAL_SRC_FILES := $(addprefix httptunnel/, $(HTTPTUNNEL_SOURCE))
include $(BUILD_EXECUTABLE)