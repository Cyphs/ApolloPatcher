DEBUG = 0
FINALPACKAGE = 1

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
ARCHS = arm64
TARGET = iphone:16.2:15.0
else
ARCHS = armv7 arm64
TARGET = iphone:14.5:10.0
endif

INSTALL_TARGET_PROCESSES = Apollo

THEOS_DEVICE_IP = 192.168.0.12

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ApolloPatcher

$(TWEAK_NAME)_FILES = Tweak.xm SettingsController.m fishhook.c
$(TWEAK_NAME)_FRAMEWORKS = UIKit SafariServices
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk
