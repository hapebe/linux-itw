#!/bin/bash
lscpu | sed 's/  */ /g;'
