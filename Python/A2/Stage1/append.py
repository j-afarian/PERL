#!/usr/bin/env python3.6

# This service appends previous data to a file.

import requests
import sys
from subprocess import run, PIPE

def append_file():
    input = sys.stdin.read()

    # Ensure that the flag from the previous service has been passed in correctly
    if input:
        try:
            with open("appendFile.txt", "a+") as file:
                file.write(input + "\n")

        except:
            print ("An error has occured writing to the file, ending program")
            sys.exit(1)

    else:
        sys.exit(1)


def main():
	quit = append_file()


main()
sys.exit(0)
