#!/bin/bash
# This somehow works, but consecutive tabs (i.e. very long
# sequences of spaces) cannot be handled approriately.
# Also, trailing spaces will be converted into tabs.
tr -s " " < text-with-spaces | tr " " "\t"
