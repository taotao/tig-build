PROJECT=tig
VERSION=2.1.1
MAINTAINER=jonas
ARCHIVE=$(PROJECT)-$(VERSION).tar.gz
DL_PATH=https://github.com/$(MAINTAINER)/$(PROJECT)/archive/$(ARCHIVE)

.PHONY: all download uncompress build clean

all: download uncompress build

download:
	wget -q $(DL_PATH) -O $(ARCHIVE)

uncompress: $(ARCHIVE)
	tar zxf $(ARCHIVE)

build:
	cd $(PROJECT)-$(PROJECT)-$(VERSION) && \
	./autogen.sh && \
	./configure && \
	make

clean:
	rm -rf $(PROJECT)-$(PROJECT)-$(VERSION)
	rm -rf $(PROJECT)-$(VERSION).tar.gz
