NAME = audna
TARGET = bin/audna

.PHONY: build test

all: build test

build:
	mkdir -p bin
	mv src/main.pl $(TARGET)
	chmod +x $(TARGET)

test:
	$(TARGET)

install:
	install -Dm755 "$(TARGET)" "$(DESTDIR)/usr/bin/$(NAME)"
	install -Dm644 "LICENSE" "$(DESTDIR)/usr/share/licenses/$(NAME)/LICENSE"

uninstall:
	rm -rfv "$(DESTDIR)/usr/bin/$(NAME)" "$(DESTDIR)/usr/share/licenses/$(NAME)"
