#!/bin/bash

# SEMI - When given an item, check the subject line. If it's one line and has
#        semicolons in it, split them up into individual subject entries, so
#        that the system is able to treat it properly.

SUBJECT=$(ia metadata $1 | sed 's/.*"subject": "//g' | cut -f1 -d'"')
SEMI=$(echo $SUBJECT | grep \;)
if [ "$SEMI" ]; then
    echo "$1 - Yep, semicolon problem."
    echo "Right now it thinks the subject is $SUBJECT"
    doner=1
    var=1
    args=""
    while [ "$doner" = "1" ]; do
        FOOF=$(echo $SUBJECT | cut -f ${var} -d ";" | sed 's/^ //g')
        if [ "$FOOF" = "" ]; then
            break
        fi
        echo "----- $FOOF"
        args="$args --modify 'subject:$FOOF'"
        ((var++))
    done
    ia metadata $1 $args
else
    echo "$1 - No semicolon problem."
fi
