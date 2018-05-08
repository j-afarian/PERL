#!/usr/bin/env python3

# Documentation for the requests system
# http://docs.python-requests.org/en/master/

# To access forecasts you'll need a forecast.io account (free)
# This will give you an API key that you use in each call

import requests
import json			# so we can decode the response
import sys


def getForecast(url, apikey, latitude, longitude, options):
	path = "/forecast/" + apikey + "/" + latitude + "," + longitude  + options
	response = requests.get('https://' + url + path)
	data = response.text
	return json.loads(data)



def main():

	# should be obtained from the command line arguments
	latitude = "-37.71528"
	longitude = "145.15056"


	# Get the API key

	# It can be stored in the configuration file (recommended option for this program)
	# You would then read it from the command line arguments


	# I've placed it in a file because I don't want you to see it!
	with open("apikey.txt") as file:
		apiKey = file.readline().strip()


	url = "api.forecast.io"

	forecast = getForecast(url, apiKey, latitude, longitude, '')

	print (str(forecast))



main()

sys.exit(0)
