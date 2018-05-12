#!/usr/bin/env python3.6

# This service quits if the input was True (converted from a False morning/afternoon/evening output)

import requests
import sys
from subprocess import run, PIPE

def quit_false():
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
            sys.exit(1)
        elif flag == "False":
            return "The hour is: " + str(inputList[0])



    else:
        sys.exit(1)


def main():
	quit = quit_false()
	print(quit)


main()
sys.exit(0)
