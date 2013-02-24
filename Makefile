dirs ?= devices toolchains
TARGET ?= all

.PHONY: all $(dirs)

all: $(dirs)

clean:
	$(MAKE) TARGET=clean

dist-clean:
	$(MAKE) TARGET=dist-clean

$(dirs):
	$(MAKE) -C $@ $(TARGET)