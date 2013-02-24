NTK_ROOT ?= ..
include $(NTK_ROOT)/definitions.mk

toolchains = arm-none-eabi

has-arm-none-eabi = $(call has-command,gcc-arm-none-eabi-gcc)
url-arm-none-eabi = https://launchpad.net/gcc-arm-embedded/4.7/4.7-2012-q4-major/+download/gcc-arm-none-eabi-4_7-2012q4-20121208-linux.tar.bz2
archive-arm-none-eabi = $(NTK_TOOLCHAINS)/gcc-arm-none-eabi-4_7-2012q4-20121208-linux.tar.bz2

.PHONY: all
all: $(toolchains)

clean: arm-none-eabi-clean

dist-clean: arm-none-eabi-dist-clean

# GCC ARM Toolchain
arm-none-eabi:

ifneq "$(has-arm-none-eabi)" "y"
arm-none-eabi: $(archive-arm-none-eabi)
	$(TAR) -xjf $(archive-arm-none-eabi) -C $(NTK_TOOLCHAINS)

endif

$(archive-arm-none-eabi):
	$(CURL) -o $(archive-arm-none-eabi) $(url-arm-none-eabi)

arm-none-eabi-clean:
arm-none-eabi-dist-clean:
	-$(RM) $(NTK_GCC_ARM_NONE_EABI)
	-$(RM) $(archive-arm-none-eabi)
