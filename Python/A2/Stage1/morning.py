#!/usr/bin/env python3.6

# This service returns TRUE if the time is prior to 12PM, or FALSE if otherwise.

import requests
import sys
from subprocess import run, PIPE

def checkMorning():
    time = sys.stdin.read()
    time = time.strip()
    time = int(time)

    # Ensure that the time from the previous service has been passed in correctly
    if time:
        # return time >= 1 and time < 12
        if time >= 1 and time < 12:
            time = str(time)+"AM"
            return time + " " + str(True)
        else:
            return False
    else:
        sys.exit(1)


def main():
	isMorning = checkMorning()
	print(isMorning)


main()
sys.exit(0)
