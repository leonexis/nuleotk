devices ?= lm4f120h5qr
TARGET ?= all

.PHONY: all $(devices)

all: $(devices)

clean:
	$(MAKE) TARGET=clean

dist-clean:
	$(MAKE) TARGET=dist-clean

$(devices):
	$(MAKE) -C $@ $(TARGET)