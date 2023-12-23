#!/bin/bash
rsync -azv --delete --exclude=".fs-overlays" --exclude=".env" . ~/Projects/november-docker-experimente
