# Marvell SAI

MRVL_VSSAI_VERSION = 1.13.0-1
ifeq ($(CONFIGURED_ARCH),arm64)
MRVL_SAI_VERSION = 1.12.0-2
else
MRVL_SAI_VERSION = 1.13.0-1
endif
export $(MRVL_SAI_VERSION)
MRVL_SAI = mrvllibsai_$(MRVL_SAI_VERSION)_$(PLATFORM_ARCH).deb
$(MRVL_SAI)_URL = "https://github.com/Marvell-switching/sonic-marvell-binaries/raw/master/$(CONFIGURED_ARCH)/sai-plugin/$(MRVL_SAI)"

$(eval $(call add_conflict_package,$(MRVL_SAI),$(LIBSAIVS_DEV)))
SONIC_ONLINE_DEBS += $(MRVL_SAI)
$(MRVL_SAI)_SKIP_VERSION=y

MRVL_VS_SAI = mrvlvslibsai_$(MRVL_VSSAI_VERSION)_$(PLATFORM_ARCH).deb
$(MRVL_VS_SAI)_URL = "https://github.com/Marvell-switching/sonic-marvell-binaries/raw/master/native/sai-plugin/$(MRVL_VS_SAI)"

SONIC_ONLINE_DEBS += $(MRVL_VS_SAI)
$(MRVL_VS_SAI)_SKIP_VERSION=y
