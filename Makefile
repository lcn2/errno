#!/usr/bin/env make
#
# errno - print a system error message
#
# Copyright (c) 1987,1999,2015,2023,2025 by Landon Curt Noll.  All Rights Reserved.
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
# chongo (Landon Curt Noll) /\oo/\
#
# http://www.isthe.com/chongo/index.html
# https://github.com/lcn2
#
# Share and enjoy!  :-)


#############
# utilities #
#############

CC= cc
CHMOD= chmod
CP= cp
ID= id
INSTALL= install
RM= rm
SHELL= bash

#CFLAGS= -O3 -g3 --pedantic -Wall -Werror
CFLAGS= -O3 -g3 --pedantic -Wall


######################
# target information #
######################

# V=@:  do not echo debug statements (quiet mode)
# V=@   echo debug statements (debug / verbose mode)
#
V=@:
#V=@

PREFIX= /usr/local
DESTDIR= ${PREFIX}/bin

TARGETS= errno


######################################
# all - default rule - must be first #
######################################

all: ${TARGETS}
	${V} echo DEBUG =-= $@ start =-=
	${V} echo DEBUG =-= $@ end =-=

errno.o: errno.c
	${CC} ${CFLAGS} errno.c -c

errno: errno.o
	${CC} ${CFLAGS} errno.o -o $@



#################################################
# .PHONY list of rules that do not create files #
#################################################

.PHONY: all configure clean clobber install


###################################
# standard Makefile utility rules #
###################################

configure:
	${V} echo DEBUG =-= $@ start =-=
	${V} echo DEBUG =-= $@ end =-=

clean:
	${V} echo DEBUG =-= $@ start =-=
	${RM} -f errno.o
	${V} echo DEBUG =-= $@ end =-=

clobber: clean
	${V} echo DEBUG =-= $@ start =-=
	${RM} -f errno
	${V} echo DEBUG =-= $@ end =-=

install: all
	${V} echo DEBUG =-= $@ start =-=
	@if [[ $$(${ID} -u) != 0 ]]; then echo "ERROR: must be root to make $@" 1>&2; exit 2; fi
	${INSTALL} -d -m 0755 ${DESTDIR}
	${INSTALL} -m 0555 ${TARGETS} ${DESTDIR}
	${V} echo DEBUG =-= $@ end =-=
