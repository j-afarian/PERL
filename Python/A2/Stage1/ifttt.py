#!/usr/bin/env python3

# Documentation for the requests system
# http://docs.python-requests.org/en/master/

import requests
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


for value in flows.keys():
    print (value, " => ", flows[value])

for value in services.keys():
    print (value, " => ", services[value])


# Loop through the service / flows.
# If a service calls sys.exit(1) then this will end.

#stdOut = 0
stdInput = ''
inputVar = ''

#while stdOut == 0:
for flow in flows:
    print ("\nRunning flow: ", flow)

    for service in flows.get(flow):
        print ("\nRunning service:", service)

        serviceDetails = services.get(service)
        program = serviceDetails.get("program")
        parameters = serviceDetails.get("parameters")

        #print ("Program for", service, "is", program)
        #print ("Parameters for", service, "is", parameters)

        # Only include parameters in the command if they exist
        if parameters == None:
            command = [program]
        else:
            command = [program, parameters]

        #print ("Command:", command)

        p = run(command, stdout=PIPE, input='11', encoding='uft-8')
        print ("return code:", p.returncode)
        print ("stdout:", p.stdout)
        stdOut = p.returncode

        stdInput = p.stdout.strip()
        print("stdinput:",stdInput)



# stdOut = 0
# while stdOut == 0:
#     for flow in flows:
#         for service in flow["services"]:
#             program = service['program']
#             parameters = service['parameters']
#             command = [program, parameters]
#             p = run(command, stdout=PIPE, input=stdInput, encoding='utf-8')
#             # sOut is the return code, is 0 by default if program is running correctly.
#             #   if you want the loop to exit from another application, call sys.exit(1)
#             stdOut = p.returncode
#             # Any print functions in a service will post to this variable. Can be used to pass
#             #   date, true/false etc.. to another service. To get this variable in another service,
#             #   use sys.stdin.read() in the service and assign it to a variable
#             stdInput = p.stdout.strip()
#
#             if stdOut == 1: break
