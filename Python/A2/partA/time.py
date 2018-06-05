#!/usr/bin/env python3

# This service returns the local time in HH:MM:SS format

import sys
from time import localtime, strftime

def getTime():
    # We only need the hours for use in later services.
    return (strftime("%H", localtime()))

def main():
	time = getTime()
	print(time)

main()
sys.exit(0)
