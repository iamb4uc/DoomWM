# doomwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = vdrw.c doomwm.c util.c
OBJ = ${SRC:.c=.o}

all: options doomwm

options:
	@echo doomwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

doomwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f doomwm ${OBJ} doomwm-${VERSION}.tar.gz

dist: clean
	mkdir -p doomwm-${VERSION}
	cp -R LICENSE Makefile README.md config.h config.mk fibonacci.c\
		doomwm.1 vdrw.h util.h ${SRC} transient.c doomwm-${VERSION}
	tar -cf doomwm-${VERSION}.tar doomwm-${VERSION}
	gzip doomwm-${VERSION}.tar
	rm -rf doomwm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f doomwm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/doomwm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < doomwm.1 > ${DESTDIR}${MANPREFIX}/man1/doomwm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/doomwm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/doomwm\
		${DESTDIR}${MANPREFIX}/man1/doomwm.1

.PHONY: all options clean dist install uninstall
