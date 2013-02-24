NTK_ROOT=../..
PART=LM4F120H5QR

# Set the default rule
all:

# Include standard defs
include $(NTK_ROOT)/definitions.mk

REPO_STELLARISWARE = https://github.com/leonexis/stellarisware-bsd.git
REPO_LM4TOOLS = https://github.com/utzig/lm4tools.git

.PHONY: all
all: repos tools

.PHONY: repos
repos: stellarisware lm4tools

stellarisware:
	$(GIT_CLONE) $(REPO_STELLARISWARE) stellarisware

lm4tools:
	$(GIT_CLONE) $(REPO_LM4TOOLS) lm4tools

.PHONY: tools
tools: lm4tools/lm4flash/lm4flash stellarisware/driverlib/gcc-cm4f/libdriver-cm4f.a

lm4tools/lm4flash/lm4flash: lm4tools
	$(MAKE) -C lm4tools/lm4flash lm4flash

stellarisware/driverlib/gcc-cm4f/libdriver-cm4f.a: stellarisware
	$(MAKE) -C stellarisware all

.PHONY: clean
clean:
	$(MAKE) -C stellarisware clean
	$(MAKE) -C lm4tools/lm4flash clean

.PHONY: dist-clean
dist-clean:
	$(RM) stellarisware
	$(RM) lm4tools
