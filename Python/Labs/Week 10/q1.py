#!/usr/bin/env python

# Jenna Afarian - S3511312
# Assumptions:
# 1) Only http:// will be valid (not https://) as per the q1 requirements:
#    "The URL should support the file:// and http:// prefixes."
# 2) "Displayed to the screen" means printed in terminal:
#    "...open the file and display it to the screen"
#    "...display the raw html to the screen"

import sys
import urllib

if len(sys.argv) > 1 and len(sys.argv) < 3:
    url = sys.argv[1]
    # Check the URL type to handle appropriately
    if 'http://' in url:
        try:
            file = urllib.urlopen(url)
            # Print the raw HTML of the webpage to the terminal window
            print file.read()

        except IOError:
            print "File was unable to be opened, check validity of the URL."

    elif 'file://' in url:
        # Remove the 'file://' prefix so url is in a valid format for python to open
        url = url.replace("file://", "")
        try:
            file = open(url, "r")
            # Print the contents of the file to the terminal window
            print file.read()
        except IOError:
            print "File was unable to be opened, check validity of the URL."

    else:
        print "This program only accepts URL's in the format http:// or file://"

else:
    print "Error: This script takes one URL as a command line parameter. Please try again."
