#!/usr/bin/env python

# Jenna Afarian - s3511312

def dayofyear(n):
    date = ""

    if (n >=1 and n <=31):
        date = "January " + str(n)

    elif (n >= 32 and n <=59):
        date = "February " + str(n - 31)

    elif (n >= 60 and n <= 90):
        date = "March " + str(n - 59)

    elif (n >= 91 and n <= 120):
        date = "April " + str(n - 90)

    elif (n >= 121 and n <= 151):
        date = "May " + str(n - 120)

    elif (n >= 152 and n <= 181):
        date = "June " + str(n - 151)

    elif (n >= 182 and n <= 212):
        date = "July " + str(n - 181)

    elif (n >= 213 and n <= 243):
        date = "August " + str(n - 212)

    elif (n >= 244 and n <= 273):
        date = "September " + str(n - 243)

    elif (n >= 274 and n <= 304):
        date = "October " + str(n - 273)

    elif (n >= 305 and n <= 334):
        date = "November " + str(n - 304)

    elif (n >= 335 and n <= 365):
        date = "December " + str(n - 334)

    else:
        print "ERROR: Invalid day number."

    return date


# Use example:
day = input("Please enter a day of the year between 1 and 365: ")
print dayofyear(day)
