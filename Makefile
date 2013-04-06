TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

INSTALL=install

.PHONY: ${TARGETS} ${SUBDIRS}

all::	unsplit

${TARGETS}::

clobber distclean:: clean

check::	unsplit
	./unsplit ${ARGS}

install:: unsplit
	${INSTALL} -D unsplit ${BINDIR}/unsplit

uninstall::
	${RM} ${BINDIR}/unsplit

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
