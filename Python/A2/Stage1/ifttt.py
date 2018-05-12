#!/usr/bin/env python3.6

# Documentation for the requests system
# http://docs.python-requests.org/en/master/

import json			# so we can decode the response
import sys
from subprocess import run, PIPE

# Check for a .json file passed in through the command line
if len(sys.argv) > 1:
    arg_json = open(sys.argv[1])
    arg_text = arg_json.read()
    services = json.loads(arg_text)['services']
    flows = json.loads(arg_text)['flows']

# When no command line argument is present, use default ifttt.json in local directory
else:
    arg_json = open('ifttt.json')
    arg_text = arg_json.read()
    services = json.loads(arg_text)['services']
    flows = json.loads(arg_text)['flows']

# Loop through the service / flows.
# If a service calls sys.exit(1) then this will end via 'break'
returnCode = 0
newInput = ''

while returnCode == 0:
    for flow in flows:
        print ("\n\nRunning flow: ", flow, "\n---------------------------")

        for service in flows.get(flow):
            print ("\nRunning service:", service)

            serviceDetails = services.get(service)
            program = serviceDetails.get("program")
            parameters = serviceDetails.get("parameters")

            # Only include parameters in the command if they exist
            if parameters == None:
                command = [program]
            else:
                command = [program, parameters]


            p = run(command, stdout=PIPE, input=newInput, encoding='utf-8')

            # Print details to terminal about return code flags,
            # and input / output which has been passed along.
            returnCode = p.returncode
            print ("Return code:", returnCode)

            if p.stdout:
                print ("Output:", p.stdout.strip())

            newInput = p.stdout.strip()


            if returnCode == 1:
                print ("A service has requested to end this program... Ending...")
                break
