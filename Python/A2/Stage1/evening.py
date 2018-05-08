#!/usr/bin/env python3

# This service returns TRUE if the time is after 6PM, or FALSE if otherwise.

import requests
import sys

def checkEvening():
    # Ensure that the time from the previous service has been passed in correctly
    if len(sys.argv) > 1:
        time = sys.argv[1]
    else:
        print("Something went wrong, time was not successfully passed into the 'Evening' service")
        sys.exit(1)


    if int(time) >= 18 and int(time) <= 23:
        return True
    else:
        return False


def main():
	isEvening = checkEvening()
	print(isEvening)


main()
sys.exit(0)
