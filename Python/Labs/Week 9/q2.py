#!/usr/bin/env python

# Jenna Afarian - S3511312

class Quack(object):
    "A class implementing a hybrid queue/stack."
    def __init__(self):
        self.hybrid = []
    def push(self, a):
        "Push a value to the end."
        self.hybrid.append(a)
    def pop_end(self):
        "Pop a value from the end (stack)."
        return self.hybrid.pop()
    def pop_start(self):
        "Pop a value from the start (queue)."
        return self.hybrid.pop(0)

# Sample run code:
quack = Quack()
quack.push('one')
quack.push(2)
quack.push(3)
quack.push('last')

print quack.pop_end() # last
print quack.pop_start() # one

