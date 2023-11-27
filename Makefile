# NS - Net Synth term
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = ns.c x.c boxdraw.c
OBJ = $(SRC:.c=.o)

all: ns

config.h:
	cp config.def.h config.h

.c.o:
	$(CC) $(NSCFLAGS) -c $<

ns.o: config.h ns.h win.h
x.o: arg.h config.h ns.h win.h
boxdraw.o: config.h ns.h boxdraw_data.h

$(OBJ): config.h config.mk

ns: $(OBJ)
	$(CC) -o $@ $(OBJ) $(NSLDFLAGS)

clean:
	rm -f ns $(OBJ) ns-$(VERSION).tar.gz

release:
	mkdir -p ns-$(VERSION)
	cp -R ns config.mk arg.h ns.h ns.1 ns.info win.h readme.md\
		Makefile config.def.h boxdraw_data.h $(SRC) ns.desktop\
		ns-$(VERSION)
	tar -cf - ns-$(VERSION) | gzip > ns-$(VERSION).tar.gz
	rm -rf ns-$(VERSION)

install: ns
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f ns $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/ns
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < ns.1 > $(DESTDIR)$(MANPREFIX)/man1/ns.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/ns.1
	tic -sx ns.info
	mkdir -p $(DESTDIR)$(APP)
	cp -f ns.desktop $(DESTDIR)$(APP)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ns
	rm -f $(DESTDIR)$(MANPREFIX)/man1/ns.1
	rm -f $(DESTDIR)$(APP)/ns.desktop

.PHONY: all release clean install uninstall
