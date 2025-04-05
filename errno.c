/*
 * errno - print a system error message
 *
 * Copyright (c) 1987,1999,2015,2023,2025 by Landon Curt Noll.  All Rights Reserved.
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
 * chongo (Landon Curt Noll) /\oo/\
 *
 * http://www.isthe.com/chongo/index.html
 * https://github.com/lcn2
 *
 * Share and Enjoy!     :-)
 */


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>


/*
 * official version
 */
#define VERSION "1.4.1 2025-04-04"          /* format: major.minor YYYY-MM-DD */



/*
 * usage message
 */
static const char * const usage =
  "usage: %s [-h] [-V] errno ...\n"
        "\n"
        "    -h            print help message and exit\n"
        "    -V            print version string and exit\n"
        "\n"
        "    errno ...       errno / exit value as an integer\n"
        "\n"
        "Exit codes:\n"
        "    0         all OK\n"
        "    2         -h and help string printed or -V and version string printed\n"
        "    3         command line error\n"
        " >= 10        internal error\n"
        "\n"
        "%s version: %s\n";


/*
 * static declarations
 */
static char *program = NULL;    /* our name */
static char *prog = NULL;       /* basename of program */
static const char * const version = VERSION;


int
main(int argc, char *argv[])
{
    int err;		/* the error number to print */
    int i;

    /*
     * parse args
     */
    program = argv[0];
    prog = rindex(program, '/');
    if (prog == NULL) {
        prog = program;
    } else {
        ++prog;
    }
    while ((i = getopt(argc, argv, ":hv:Vnco:")) != -1) {
        switch (i) {

        case 'h':                   /* -h - print help message and exit */
	    fprintf(stderr, usage, program, prog, version);
            exit(2); /* ooo */
            /*NOTREACHED*/

        case 'V':                   /* -V - print version string and exit */
            (void) printf("%s\n", version);
            exit(2); /* ooo */
            /*NOTREACHED*/

	case ':':
            (void) fprintf(stderr, "%s: ERROR: requires an argument -- %c\n", program, optopt);
	    fprintf(stderr, usage, program, prog, version);
            exit(3); /* ooo */
            /*NOTREACHED*/

        case '?':
            (void) fprintf(stderr, "%s: ERROR: illegal option -- %c\n", program, optopt);
	    fprintf(stderr, usage, program, prog, version);
            exit(3); /* ooo */
            /*NOTREACHED*/

        default:
            fprintf(stderr, "%s: ERROR: invalid -flag\n", program);
	    fprintf(stderr, usage, program, prog, version);
            exit(3); /* ooo */
            /*NOTREACHED*/
        }
    }

    /* process each error number */
    while (argc > 1) {

	/* obtain the error number */
	err = atoi(argv[1]);
	++argv;
	--argc;

	/* print the system error message */
	printf("%s\n", strerror(err));
    }
    exit(0);
}
