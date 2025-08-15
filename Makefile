# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = vdrw.c vdwm.c util.c
OBJ = ${SRC:.c=.o}

all: options vdwm

options:
	@echo vdwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

vdwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f vdwm ${OBJ} vdwm-${VERSION}.tar.gz

dist: clean
	mkdir -p vdwm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		vdwm.1 drw.h util.h ${SRC} vdwm.png transient.c vdwm-${VERSION}
	tar -cf vdwm-${VERSION}.tar vdwm-${VERSION}
	gzip vdwm-${VERSION}.tar
	rm -rf vdwm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f vdwm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/vdwm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < vdwm.1 > ${DESTDIR}${MANPREFIX}/man1/vdwm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/vdwm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/vdwm\
		${DESTDIR}${MANPREFIX}/man1/vdwm.1

.PHONY: all options clean dist install uninstall
