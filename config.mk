# NS version
VERSION = 0.2

# Customize below to fit your system

# Paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
APP = $(PREFIX)/share/applications

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
NSCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
NSCFLAGS = $(INCS) $(NSCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
NSLDFLAGS = $(LIBS) $(LDFLAGS)

# compiler and linker
CC = c99
