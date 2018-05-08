#!/usr/bin/env python3

# This service returns TRUE if the time is prior to 12PM, or FALSE if otherwise.

import requests
import sys

def checkMorning():
    # Ensure that the time from the previous service has been passed in correctly
    if len(sys.argv) > 1:
        time = sys.argv[1]
    else:
        print("Something went wrong, time was not successfully passed into the 'Morning' service")
        sys.exit(1)


    if int(time) >= 1 and int(time) < 12:
        return True
    else:
        return False


def main():
	isMorning = checkMorning()
	print(isMorning)


main()
sys.exit(0)
