# errno

print a system error message


# To install

```sh
make clobber all
sudo make install clobber
```


# Example

```sh
$ /usr/local/bin/errno 1
Operation not permitted

$ /usr/local/bin/errno 2 3 5 7
No such file or directory
No such process
Input/output error
Argument list too long
```


# To use

```sh
/usr/local/bin//errno [-h] [-V] errno ...

    -h            print help message and exit
    -V            print version string and exit

    errno ...       errno / exit value as an integer

Exit codes:
    0         all OK
    2         -h and help string printed or -V and version string printed
    3         command line error
 >= 10        internal error

errno version: 1.4.1 2025-04-04
```


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/XXX/security/policy)".
