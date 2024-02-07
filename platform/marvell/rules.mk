#include $(PLATFORM_PATH)/sdk.mk
include $(PLATFORM_PATH)/sai.mk
include $(PLATFORM_PATH)/docker-syncd-mrvl.mk
include $(PLATFORM_PATH)/docker-syncd-mrvl-rpc.mk
include $(PLATFORM_PATH)/docker-saiserver-mrvl.mk
include $(PLATFORM_PATH)/docker-syncd-mrvl-prestera.mk
include $(PLATFORM_PATH)/docker-syncd-mrvl-vs.mk
include $(PLATFORM_PATH)/libsaithrift-dev.mk
include $(PLATFORM_PATH)/one-image.mk
ifeq ($(CONFIGURED_ARCH),arm64)
include $(PLATFORM_PATH)/mrvl-prestera.mk
endif
include $(PLATFORM_PATH)/platform-nokia.mk
include $(PLATFORM_PATH)/platform-marvell.mk
include $(PLATFORM_PATH)/onie.mk
include $(PLATFORM_PATH)/kvm-image.mk

SONIC_ALL += $(SONIC_ONE_IMAGE) \
             $(DOCKER_FPM) 	\
             $(DOCKER_SYNCD_MRVL_RPC) \
             $(DOCKER_SYNCD_MRVL_PRESTERA) \
             $(DOCKER_SYNCD_MRVL_VS) \
	     $(SONIC_KVM_IMAGE)


# Inject mrvl sai into syncd
$(SYNCD)_DEPENDS += $(MRVL_SAI)
$(SYNCD)_UNINSTALLS += $(MRVL_SAI)

ifeq ($(ENABLE_SYNCD_RPC),y)
$(SYNCD)_DEPENDS += $(LIBSAITHRIFT_DEV)
endif
