/*
 * errno - print a system error message
 *
 * usage:
 *	errno num ...
 *
 * @(#) $Revision: 1.3 $
 * @(#) $Id: errno.c,v 1.3 1999/09/27 05:36:31 chongo Exp root $
 * @(#) $Source: /usr/local/src/bin/errno/RCS/errno.c,v $
 *
 * Copyright (c) 1987,2015 by Landon Curt Noll.  All Rights Reserved.
 *
 * Permission to use, copy, modify, and distribute this software and
 * its documentation for any purpose and without fee is hereby granted,
 * provided that the above copyright, this permission notice and text
 * this comment, and the disclaimer below appear in all of the following:
 *
 *       supporting documentation
 *       source copies
 *       source works derived from this source
 *       binaries derived from this source or from derived source
 *
 * LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
 * EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
 * USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
 * OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 *
 * chongo <was here> /\oo/\
 *
 * Share and enjoy!
 */

#include <stdio.h>
#include <stdlib.h>

extern int errno;		/* last system error */
extern const char *const sys_errlist[];	/* perror message list */
extern int sys_nerr;		/* length of sus_errlist */

main(argc, argv)
    int argc;		/* arg count */
    char *argv[];	/* the args */
{
    int err;		/* the error number to print */

    /* process each error number */
    while (argc > 1) {

	/* obtain the error number */
	err = atoi(argv[1]);
	++argv;
	--argc;

	/* detect bad error numbers */
	if (err < 0 || err >= sys_nerr) {
	    printf("Unknown error number %d\n", err);

	/* print the system error message */
	} else {
	    printf("%s\n", sys_errlist[err]);
	}
    }
    exit(0);
}
