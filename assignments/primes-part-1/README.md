---
---

# primes part 1

This program prints all the prime numbers between 1 and 100.



## Dependencies

To run the pre-built archive, all you will need to install is Java.



## Usage

Download the pre-built archive
[here](target/uberjar/primes-part-1.jar),
and save it to `/some/directory/`. Once that has been done, you may run the program from any standard UNIX shell with:

```bash
$ java -jar /some/directory/primes-part-1.jar
```



## Building from source

To build from source, first download the source code [here](primes-part-1.tar.gz), and save it in `/some/directory/`. Then extract the source code using

```bash
$ tar xvzf primes-part-1.tar.gz
```

Now you must install [leiningen](http://leiningen.org/). Once that is done, you may build the package with:

```bash
$ cd /some/directory/primes-part-1/
$ lein uberjar
```

You will find that the file `/some/directory/primes-part-1/target/uberjar/primes-part-1.jar` has now been created, and can be run as described in the *Usage* section.



## License

Copyright © 2015 Daniel Wysocki, under the MIT License
