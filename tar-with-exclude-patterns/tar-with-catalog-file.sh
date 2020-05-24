#!/bin/bash
tar -cvzf ./archive.tar.gz -X tar-exclude-patterns ~ >catalog 2>/dev/null
