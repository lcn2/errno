#!/usr/bin/make
#
# errno - print a system message
#
# @(#) $Revision: 1.1 $
# @(#) $Id: Makefile,v 1.1 1999/09/22 02:18:39 chongo Exp chongo $
# @(#) $Source: /usr/local/src/cmd/errno/RCS/Makefile,v $
#
# Copyright (c) 1987 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo <was here> /\oo/\
#
# Share and enjoy!

SHELL=/bin/sh
INSTALL=/usr/local/etc/install
CC=cc
CFLAGS=-O
DESTDIR=/usr/local/bin
#DESTDIR=${HOME}/bin

all: errno

errno: errno.o
	${CC} ${CFLAGS} errno.o -o errno

errno.o: errno.c
	${CC} ${CFLAGS} errno.c -c

clean:
	rm -f errno.o

clobber: clean
	rm -f errno

install: all
	-chmod +w ${DESTDIR}/errno
	cp errno ${DESTDIR}
	chmod 0555 ${DESTDIR}/errno
	#${INSTALL} -m 0555 errno ${DESTDIR}

installman:
