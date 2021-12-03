# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)
CUSTOM_DEVICE ?= $(TARGET_DEVICE)
ifneq ($(filter OFFICIAL,$(CUSTOM_BUILD_TYPE)),)
BUILD_SIGNATURE_KEYS := release-keys
else
BUILD_SIGNATURE_KEYS := test-keys
endif
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CUSTOM_DEVICE)/$(CUSTOM_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.sys.recovery_update=true
endif

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    org.pixelplusui.version=$(PPUI_BASE_VERSION) \
    org.pixelplusui.version.display=$(CUSTOM_VERSION) \
    org.pixelplusui.build_date=$(CUSTOM_BUILD_DATE) \
    org.pixelplusui.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    org.pixelplusui.build_type=$(CUSTOM_BUILD_TYPE) \
    org.pixelplusui.codename=$(PPUI_CODENAME) \
    ro.pixelplusui.maintainer=$(PPUI_MAINTAINER)
