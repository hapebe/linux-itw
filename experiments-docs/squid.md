# Use squid as a HTTP(S) proxy; generate reports & stats about it

* Installed squid from package in OpenSuSe Leap
* Installing squidanalyzer from http://squidanalyzer.darold.net/install.html
* Configuration:
```
perl Makefile.PL \
	LOGFILE=/var/log/squid/access.log \
	BINDIR=/usr/bin \
	CONFDIR=/etc \
	HTMLDIR=/srv/www/htdocs/squidreport \
	BASEURL=/squidreport \
	MANDIR=/usr/man/man3 \
	DOCDIR=/usr/share/doc/squidanalyzer
```
* make passed without problems...
* sudo make install equally well!
* ran: squid-analyzer
* http://192.168.20.57/squidreport/ now serves the analysis results!
* recommended crontab entry:
```
# SquidAnalyzer log reporting daily
23 9 * * * squid-analyzer > /dev/null 2>&1
```

## Further Reading

Use squid as a transparent / forced proxy, to block certain sites?
See: http://www.squidguard.org/
