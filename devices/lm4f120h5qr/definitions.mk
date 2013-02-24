# Makefile definitions for TI Stellaris LM4F120H5QR Launchpad

DEVICE_ROOT = $(realpath $(NTK_ROOT))/devices/lm4f120h5qr
SW_ROOT = $(DEVICE_ROOT)/stellarisware
ROOT ?= $(SW_ROOT)
IPATH ?= $(SW_ROOT)

LM4FLASH ?= $(DEVICE_ROOT)/lm4tools/lm4flash/lm4flash
PATH:=$(PATH):$(DEVICE_ROOT)/lm4tools/lm4flash

include $(ROOT)/makedefs

flash: $(LM4FLASH)

$(LM4FLASH):
	$(MAKE) -C $(DEVICE_ROOT) lm4tools/lm4flash/lm4flash

${ROOT}/driverlib/gcc-cm4f/libdriver-cm4f.a:
	$(MAKE) -C $(DEVICE_ROOT) stellarisware/driverlib/gcc-cm4f/libdriver-cm4f.a

ifneq "$(call has-command,gcc-arm-none-eabi-gcc)" "y"
# We dont have a usable gcc, change the prefix, add path
PATH:=$(PATH):$(NTK_GCC_ARM_NONE_EABI_PATH)

# Reset PREFIX variables because $(shell) doesnt inherit the exported 
# environment. See: http://savannah.gnu.org/bugs/?10593,
# http://www.cmcrossroads.com/article/basics-getting-environment-variables-gnu-make

PREFIX=$(NTK_GCC_ARM_NONE_EABI_PATH)/arm-none-eabi

# Make sure that we have toolchain built
gcc: $(PREFIX)-gcc

$(PREFIX)-gcc:
	$(MAKE) -C $(NTK_TOOLCHAINS) arm-none-eabi

endif

export PATH