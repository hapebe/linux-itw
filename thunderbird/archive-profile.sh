#!/bin/bash
tar -cJvf Thunderbird-$(date +%Y-%m-%d).tar.xz -C ~/.thunderbird pgbzgjtm.default-esr
# restore such backup:
# cd ~/.thunderbird/
# tar -xJvf /path/to/your/backup/Thunderbird-*.tar.xz
