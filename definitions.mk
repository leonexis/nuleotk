# Makefile definitions for all of NTK

NTK_ROOT ?= $(CURDIR)

# Common commands used
RM = rm -rf
MKDIR = mkdir -p

GIT = git
GIT_CLONE = $(GIT) clone
CURL = curl -L
TAR = tar

has-command = $(shell type $1 2>&1 > /dev/null && echo y)

# Include toolchain defs
include $(NTK_ROOT)/toolchains/definitions.mk

# Include definitions based on part
ifeq ($(PART), LM4F120H5QR)
include $(NTK_ROOT)/devices/lm4f120h5qr/definitions.mk
endif
