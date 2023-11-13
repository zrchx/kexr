# NS - Net Synth term
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = st.c x.c boxdraw.c
OBJ = $(SRC:.c=.o)

all: st

config.h:
	cp config.def.h config.h

.c.o:
	$(CC) $(STCFLAGS) -c $<

st.o: config.h st.h win.h
x.o: arg.h config.h st.h win.h
boxdraw.o: config.h st.h boxdraw_data.h

$(OBJ): config.h config.mk

ns: $(OBJ)
	$(CC) -o $@ $(OBJ) $(STLDFLAGS)

clean:
	rm -f ns $(OBJ) ns-$(VERSION).tar.gz

release:
	mkdir -p ns-$(VERSION)
	cp -R ns config.mk arg.h st.h st.1 st.info win.h readme.md\
		Makefile config.def.h boxdraw_data.h $(SRC) ns.desktop\
		ns-$(VERSION)
	tar -cf - ns-$(VERSION) | gzip > ns-$(VERSION).tar.gz
	rm -rf ns-$(VERSION)

install: ns
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f ns $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/ns
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < st.1 > $(DESTDIR)$(MANPREFIX)/man1/ns.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/ns.1
	mkdir -p $(DESTDIR)$(PREFIX)/share/terminfo
	tic -o $(DESTDIR)$(PREFIX)/share/terminfo -sx st.info
	mkdir -p $(DESTDIR)$(APP)
	cp -f ns.desktop $(DESTDIR)$(APP)
	cp -f Xresources ~/.Xresources

locali: ns
	mkdir -p $(LOCALDIR)/bin
	cp -f ns $(LOCALDIR)/bin
	chmod 755 $(LOCALDIR)/bin/ns
	mkdir -p $(LOCALDIR)/man1
	sed "s/VERSION/$(VERSION)/g" < st.1 > $(LOCALDIR)/man1/ns.1
	chmod 644 $(LOCALDIR)/man1/ns.1
	mkdir -p $(PREFIXLOCAL)/terminfo
	tic -o $(PREFIXLOCAL)/terminfo -sx st.info
	mkdir -p $(LOCALAPP)
	cp -f ns.desktop $(LOCALAPP)
	cp -f Xresources ~/.Xresources

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ns
	rm -f $(DESTDIR)$(MANPREFIX)/man1/ns.1
	rm -f $(DESTDIR)$(PREFIX)/share/terminfo/x/*
	rm -f $(DESTDIR)$(APP)/ns.desktop

localu:
	rm -rf $(LOCALDIR)/bin
	rm -rf $(LOCALDIR)/man1
	rm -rf $(PREFIXLOCAL)/terminfo
	rm -rf $(LOCALAPP)

.PHONY: all release clean install uninstall locali localu
