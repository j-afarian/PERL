#!/usr/bin/env python3

# This service returns TRUE if the time is between 12PM and 6PM, or FALSE if otherwise.

import requests
import sys

def checkAfternoon():
    # Ensure that the time from the previous service has been passed in correctly
    if len(sys.argv) > 1:
        time = sys.argv[1]
    else:
        print("Something went wrong, time was not successfully passed into the 'Afternoon' service")
        sys.exit(1)


    if int(time) >= 12 and int(time) < 18:
        return True
    else:
        return False


def main():
	isAfternoon = checkAfternoon()
	print(isAfternoon)


main()
sys.exit(0)
