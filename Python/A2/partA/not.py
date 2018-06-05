#!/usr/bin/env python3.6

# This service converts a FALSE flag from the previous time of day check into true
# in order to end the process if required.

# The assignment specification does say to "quit if false input is provided", but
# the following assumptions have been made:
# - Example flow may be time > morning > not > quit if false.
# - If morning returns false, we should quit this flow.
# - Passing the false from morning directly into this program makes the 'not' program redundant
# - It is logical that we should instead convert false output to true, and trigger quit if true.

import requests
import sys
from subprocess import run, PIPE

def reverseFalse():
    input = sys.stdin.read()
    inputList = str.split(input)

    # Check number of items in the list. Previous programs may have passed
    # 1-2 items in a string (time + boolean) or (boolean).
    if len(inputList) > 1:
        flag = inputList[1]
    else:
        flag = inputList[0]

    # Ensure that the flag from the previous service has been passed in correctly
    if flag:
        if flag == "True":
            return str(inputList[0]) + " " + "False"
        elif flag == "False":
            return True

    else:
        sys.exit(1)


def main():
	returnFlag = reverseFalse()
	print(returnFlag)


main()
sys.exit(0)
