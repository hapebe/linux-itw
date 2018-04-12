# Trying to install apache2 on OpenSuse from source

_Following instructions from ISBN 978-3-8362-2694-3 and from http://httpd.apache.org/docs/2.4/install.html_

* Download apache source tar: http://mirror.softaculous.com/apache//httpd/httpd-2.4.33.tar.bz2 , unpack
* Turns out I need the Apache Portable Runtime (APR) as well:
  * http://apache.mirror.iphh.net//apr/apr-1.6.3.tar.bz2
  * http://apache.mirror.iphh.net//apr/apr-util-1.6.1.tar.bz2
* Trying to run ./configure --enable-http --enable-https --enable-so --enable-cgi
  * Need PCRE, try: sudo zypper install pcre-devel
  * After that, configure succeeds!
* make
  * Next problem:
```
xml/apr_xml.c:35:10: fatal error: expat.h: No such file or directory
 #include <expat.h>
          ^~~~~~~~~
compilation terminated.
```
  * A web search points to: sudo zypper install libexpat-devel
  * Another problem: XML-related features not found in apr code
  * Trying to build / install apr and apr-util first
     * (in apr) ./configure ; make ; make install
     * important (?) message: libtool: warning: remember to run 'libtool --finish /usr/local/apache2/lib'
     * (in apr-util) ./configure --with-apr=../apr ; make ; make install
     * error:
```
/bin/sh /usr/src/apache-2.4/httpd-2.4.33/srclib/apr/libtool --mode=install /usr/bin/install -c -m 755 libaprutil-1.la /usr/local/apr/lib
libtool:   error: error: cannot install 'libaprutil-1.la' to a directory not ending in /usr/local/apache2/lib
make: *** [Makefile:83: install] Error 1
```
     * trying again using: ./configure --with-apr=../apr --prefix=/usr/local/apache2
     * seems to work
     * ran: sudo libtool --finish /usr/local/apache2/lib
  * re-trying the httpd install triad:
     * configure fails:
```
configure: error: Cannot use an external APR with the bundled APR-util
```
     * temporarily (?) giving up at this point...

* success!
* sudo ./configure --with-apr=./srclib/apr --with-apr-util=./srclib/apr-util --prefix=/usr/local/apache2
* sudo make (no errors!)
* sudo make install
