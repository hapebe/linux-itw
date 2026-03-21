#!/bin/bash
tar -cJvf Thunderbird-$(date +%Y-%m-%d).tar.xz -C ~/.thunderbird pgbzgjtm.default-esr
# restore such backup:
# cd ~/.thunderbird/
# tar -xJvf /path/to/your/backup/Thunderbird-*.tar.xz
#
# ... and move / rename the profile folder to what was previously present on the target Thunderbird install:
#
# mv pgbzgjtm.default-esr co3d0q5u.default-esr
#
# Basically verified between two Fedora machines, 2026-03-21.
