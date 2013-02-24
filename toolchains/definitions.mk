# Toolchain locations

NTK_TOOLCHAINS ?= $(NTK_ROOT)/toolchains
NTK_GCC_ARM_NONE_EABI ?= $(NTK_TOOLCHAINS)/gcc-arm-none-eabi-4_7-2012q4
NTK_GCC_ARM_NONE_EABI_PATH = $(realpath $(NTK_GCC_ARM_NONE_EABI))/bin

