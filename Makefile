#!/usr/bin/env make
#
# errno - print a system message
#
# Copyright (c) 1987,2023 by Landon Curt Noll.  All Rights Reserved.
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

SHELL= bash
INSTALL= install
CC= cc
CFLAGS= -O3 -g3
DESTDIR= /usr/local/bin
RM= rm
CP= cp
CHMOD= chmod

all: errno

errno: errno.o
	${CC} ${CFLAGS} errno.o -o errno

errno.o: errno.c
	${CC} ${CFLAGS} errno.c -c

clean:
	${RM} -f errno.o

clobber: clean
	${RM} -f errno

install: all
	${INSTALL} -c -m 0555 errno ${DESTDIR}
