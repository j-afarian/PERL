#!/usr/bin/env python3

# Documentation for the requests system
# http://docs.python-requests.org/en/master/

import requests
import json			# so we can decode the response
import sys

def getLocation():
	response = requests.get('https://ipapi.co/json/')
	data = response.text
	return json.loads(data)


def main():
	forecast = getLocation()
	print (str(forecast))


main()

sys.exit(0)
