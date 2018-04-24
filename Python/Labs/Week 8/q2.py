#!/usr/bin/env python

def getdayofyear(n):
    date = 0

    if (n >=1 and n <=31):
        date = (1, n)

    elif (n >= 32 and n <=59):
        date = (2, n - 31)

    elif (n >= 60 and n <= 90):
        date = (3, n - 59)

    elif (n >= 91 and n <= 120):
        date = (4, n - 90)

    elif (n >= 121 and n <= 151):
        date = (5, n - 120)

    elif (n >= 152 and n <= 181):
        date = (6, n - 151)

    elif (n >= 182 and n <= 212):
        date = (7, n - 181)

    elif (n >= 213 and n <= 243):
        date = (8, n - 212)

    elif (n >= 244 and n <= 273):
        date = (9, n - 243)

    elif (n >= 274 and n <= 304):
        date = (10, n - 273)

    elif (n >= 305 and n <= 334):
        date = (11, n - 304)

    elif (n >= 335 and n <= 365):
        date = (12, n - 334)

    else:
        print "ERROR: Invalid day number."

    return date

def strday(month, day):
    strdate = ""

    if month == 1:
        strdate = "January " + str(day)

    elif month == 2:
        strdate = "February " + str(day)

    elif month == 3:
        strdate = "March " + str(day)

    elif month == 4:
        strdate = "April " + str(day)

    elif month == 5:
        strdate = "May " + str(day)

    elif month == 6:
        strdate = "June " + str(day)

    elif month == 7:
        strdate = "July " + str(day)

    elif month == 8:
        strdate = "August " + str(day)

    elif month == 9:
        strdate = "September " + str(day)

    elif month == 10:
        strdate = "October " + str(day)

    elif month == 11:
        strdate = "November " + str(day)

    elif month == 12:
        strdate = "December " + str(day)

    return strdate


# Use example:
day = input("Please enter a day of the year between 1 and 365: ")
dayyear = getdayofyear(day)
print dayyear
print strday(dayyear[0], dayyear[1])
