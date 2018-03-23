#!/bin/bash
find ~ -type f -links +1 2>/dev/null
