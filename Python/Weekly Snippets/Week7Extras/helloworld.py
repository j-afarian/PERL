#!/usr/bin/env python

import sys

if len(sys.argv) > 1:
    recipient = sys.argv[1]
else:
    recipient = "World"

print "Hello", recipient
