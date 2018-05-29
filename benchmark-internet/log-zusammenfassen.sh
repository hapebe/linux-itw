#!/bin/bash
N=$(hostname)

# abruf (100k):
grep -E "(KB/s)|(real)" abruf.log > zusammenfassung-100k-${N}.log

# abruf (dropbox 1M):
grep -E "(KB/s)|(MB/s)|(real)" abruf-dropbox.sh.log > zusammenfassung-dropbox-${N}.log

# SPON:
grep -E "(^(BEENDET|FINISHED) --2018)|((Geholt:)|(Downloaded:))|(real)" abruf-spon.sh.log > zusammenfassung-spon-${N}.log

