# Build an own kernel

_Following instructions from https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel_

* Fetch the sources of the current kernel via package manager:
  * First I had to enable the source repositories: software-properties-gtk
  * apt-get source linux-image-$(uname -r)
    * error message, but still completed (?)
```
W: Can't drop privileges for downloading as file 'linux-hwe_4.13.0-38.43~16.04.1.dsc' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
```
* Set up the necessary build dependencies:
sudo apt-get **build-dep** linux-image-$(uname -r)
Wow, impressive:
```
The following NEW packages will be installed:
  asciidoc autoconf automake autotools-dev binutils-dev bison debhelper
  dh-strip-nondeterminism dh-systemd docbook-dsssl docbook-utils docbook-xsl
  docutils-common flex fonts-font-awesome fonts-lato jadetex kernel-wedge
  libaudit-dev libbison-dev libdw-dev libelf-dev libexpat1-dev
  libfile-stripnondeterminism-perl libfl-dev libiberty-dev libjs-modernizr
  libjs-sphinxdoc libjs-underscore liblzma-dev libnewt-dev libnuma-dev libosp5
  libostyle1c2 libpci-dev libpng12-dev libpotrace0 libptexenc1 libpython-dev
  libpython2.7-dev libsgmls-perl libslang2-dev libsp1c2 libssl-dev libsynctex1
  libtexlua52 libtexluajit2 libtool libudev-dev libunwind-dev libunwind8-dev
  libzzip-0-13 lynx lynx-common m4 makedumpfile openjade po-debconf
  python-alabaster python-babel python-babel-localedata python-dev
  python-docutils python-jinja2 python-markupsafe python-pygments python-roman
  python-sphinx python-sphinx-rtd-theme python-tz python2.7-dev sgmlspl
  sharutils sp sphinx-common sphinx-rtd-theme-common tex-common texlive-base
  texlive-binaries texlive-fonts-recommended texlive-generic-recommended
  texlive-latex-base texlive-latex-recommended tipa transfig uuid-dev xmlto
  zlib1g-dev
0 upgraded, 88 newly installed, 0 to remove and 0 not upgraded.
Need to get 103 MB of archives.
After this operation, 306 MB of additional disk space will be used.
```
* Unfortunately, https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel does 
not tell me where to expect the kernel sources, and I can only seem to 
find headers for my current kernel.
* So I start over, using https://wiki.ubuntuusers.de/Kernel/Kompilierung/ this time...
* first, I've enabled source packages for apt again: software-properties-gtk
* sudo apt-get install linux-source build-essential kernel-package libssl-dev
* The resulting package list is even more impressive this time:
```
build-essential is already the newest version (12.1ubuntu2).
The following additional packages will be installed:
  dblatex docbook-dsssl docbook-utils docbook-xsl fonts-lato fonts-lmodern fonts-texgyre jadetex kernel-common
  libfile-homedir-perl libfile-which-perl libmail-sendmail-perl libosp5 libostyle1c2 libpotrace0 libptexenc1 libruby2.3
  libsgmls-perl libsp1c2 libssl-doc libsynctex1 libsys-hostname-long-perl libtexlua52 libtexluajit2 libzzip-0-13
  linux-source-4.4.0 lmodern lynx lynx-common openjade po-debconf preview-latex-style prosper ps2eps rake ruby
  ruby-did-you-mean ruby-minitest ruby-net-telnet ruby-power-assert ruby-test-unit ruby2.3 rubygems-integration sgmlspl sp
  tex-common tex-gyre texlive texlive-base texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-font-utils
  texlive-fonts-recommended texlive-fonts-recommended-doc texlive-generic-recommended texlive-latex-base
  texlive-latex-base-doc texlive-latex-extra texlive-latex-extra-doc texlive-latex-recommended texlive-latex-recommended-doc
  texlive-luatex texlive-math-extra texlive-pictures texlive-pictures-doc texlive-pstricks texlive-pstricks-doc tipa xmlto
  zlib1g-dev
Suggested packages:
  docbook inkscape latex-cjk-all opensp texlive-lang-all texlive-lang-cyrillic texlive-xetex transfig xindy
  docbook-dsssl-doc dbtoepub docbook-xsl-doc-html | docbook-xsl-doc-pdf | docbook-xsl-doc-text | docbook-xsl-doc
  docbook-xsl-saxon fop libsaxon-java libxalan2-java libxslthl-java xalan libncurses-dev sgmls-doc libncurses-dev
  | ncurses-dev libqt3-dev libmail-box-perl ri ruby-dev bundler debhelper perl-tk dvipng dvidvi fragmaster purifyeps lacheck
  chktex latexmk latexdiff psutils python-pygments libspreadsheet-parseexcel-perl libtcltk-ruby dot2tex prerex w3m
  | lynx-cur | links xmltex
Recommended packages:
  uboot-mkimage
The following NEW packages will be installed:
  dblatex docbook-dsssl docbook-utils docbook-xsl fonts-lato fonts-lmodern fonts-texgyre jadetex kernel-common
  kernel-package libfile-homedir-perl libfile-which-perl libmail-sendmail-perl libosp5 libostyle1c2 libpotrace0 libptexenc1
  libruby2.3 libsgmls-perl libsp1c2 libssl-dev libssl-doc libsynctex1 libsys-hostname-long-perl libtexlua52 libtexluajit2
  libzzip-0-13 linux-source linux-source-4.4.0 lmodern lynx lynx-common openjade po-debconf preview-latex-style prosper
  ps2eps rake ruby ruby-did-you-mean ruby-minitest ruby-net-telnet ruby-power-assert ruby-test-unit ruby2.3
  rubygems-integration sgmlspl sp tex-common tex-gyre texlive texlive-base texlive-bibtex-extra texlive-binaries
  texlive-extra-utils texlive-font-utils texlive-fonts-recommended texlive-fonts-recommended-doc texlive-generic-recommended
  texlive-latex-base texlive-latex-base-doc texlive-latex-extra texlive-latex-extra-doc texlive-latex-recommended
  texlive-latex-recommended-doc texlive-luatex texlive-math-extra texlive-pictures texlive-pictures-doc texlive-pstricks
  texlive-pstricks-doc tipa xmlto zlib1g-dev
0 upgraded, 74 newly installed, 0 to remove and 0 not upgraded.
Need to get 934 MB of archives.
After this operation, 1.479 MB of additional disk space will be used.
```
* After this, there are kernel sources in /usr/src/linux-source-4.4.0 . This is actually not my current kernel version (4.13.0-38)!
* In this directory, copy the configuration of the existing kernel: cp /boot/config-`uname -r` .config
* Then, configure while accepting all suggested settings for unknown config options: yes "" | make oldconfig
* The next step is acutally building the Kernel, which can take a very long time. I took a snapshot of my VM before starting this, so I would be able to re-start (esp. cancel) if necessary.
* make-kpkg --initrd buildpackage
* does not finish (recipe for target fs/overlayfs failed): :(
```
fs/overlayfs/super.c: In function ‘ovl_init’:
fs/overlayfs/super.c:1311:30: error: ‘ovl_v1_fs_type’ undeclared (first use in this function)
   ret = register_filesystem(&ovl_v1_fs_type);
                              ^
fs/overlayfs/super.c:1311:30: note: each undeclared identifier is reported only once for each function it appears in
fs/overlayfs/super.c: In function ‘ovl_exit’:
fs/overlayfs/super.c:1324:26: error: ‘ovl_v1_fs_type’ undeclared (first use in this function)
   unregister_filesystem(&ovl_v1_fs_type);
                          ^
scripts/Makefile.build:269: recipe for target 'fs/overlayfs/super.o' failed
make[5]: *** [fs/overlayfs/super.o] Error 1
scripts/Makefile.build:476: recipe for target 'fs/overlayfs' failed
make[4]: *** [fs/overlayfs] Error 2
Makefile:983: recipe for target 'fs' failed
make[3]: *** [fs] Error 2
make[3]: Leaving directory '/home/hapebe/kernel/linux-source-4.4.0'
debian/ruleset/targets/common.mk:295: recipe for target 'debian/stamp/build/kernel' failed
make[2]: *** [debian/stamp/build/kernel] Error 2
make[2]: Leaving directory '/home/hapebe/kernel/linux-source-4.4.0'
debian/ruleset/common/targets.mk:242: recipe for target 'debian/stamp/do-build-arch' failed
make[1]: *** [debian/stamp/do-build-arch] Error 2
make[1]: Leaving directory '/home/hapebe/kernel/linux-source-4.4.0'
dpkg-buildpackage: error: debian/rules build gave error exit status 2
debian/ruleset/targets/common.mk:401: recipe for target 'debian/stamp/build/buildpackage' failed
make: *** [debian/stamp/build/buildpackage] Error 2
```
* Try to exclude the overlayfs from kernel ...
* make xconfig does not works as well, trying to fix qt...
* sudo apt-get install qtdeclarative5-dev
* make xconfig works, but there is no switch related to overlayfs (?)
* make menuconfig / make nconfig also don't work, trying to install ncurses development package:
* sudo apt-get install libncurses5-dev
* et voila - make menuconfig works
* successfully disabled Overlay filesystem support! :-)
