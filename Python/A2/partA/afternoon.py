#!/usr/bin/env python3.6

# This service returns TRUE if the time is after 12PM but before 6PM, or FALSE if otherwise.

import requests
import sys
from subprocess import run, PIPE

def checkAfternoon():
    time = sys.stdin.read()
    time = time.strip()
    time = int(time)

    # Ensure that the time from the previous service has been passed in correctly
    if time:
        return time >= 12 and time < 18
    else:
        sys.exit(1)


def main():
	isAfternoon = checkAfternoon()
	print(isAfternoon)


main()
sys.exit(0)
