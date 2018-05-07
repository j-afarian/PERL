#!/usr/bin/env python

# Jenna Afarian - S3511312

class Queue(object):
    "A class implementing a queue data structure."
    def __init__(self):
        self.thequeue = []
    def __str__(self):
        return self.thequeue
    def queue(self, a):
        "Push a value to the top of the queue."
        self.thequeue.insert(0,a)
    def dequeue(self):
        "Remove the bottom element from the stack and return in."
        return self.thequeue.pop()

# Sample run code:
q = Queue()
q.queue('first')
q.queue('second')
q.queue(3)

print q.dequeue() #first
