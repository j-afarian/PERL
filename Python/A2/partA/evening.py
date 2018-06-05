#!/usr/bin/env python3.6

# This service returns TRUE if the time is after 6PM, or FALSE if otherwise.

import requests
import sys
from subprocess import run, PIPE

def checkEvening():
    time = sys.stdin.read()
    time = time.strip()
    time = int(time)

    # Ensure that the time from the previous service has been passed in correctly
    if time:
        return time >= 18 and time < 23
    else:
        sys.exit(1)


def main():
	isEvening = checkEvening()
	print(isEvening)


main()
sys.exit(0)
