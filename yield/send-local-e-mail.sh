#!/bin/bash
SUBJECT="Mail 1"
# TO=hapebe@hapebe-ubuntu
TO=processor@hapebe-ubuntu
mail -s "$SUBJECT" $TO < mail-text
