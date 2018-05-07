#!/usr/bin/env python

# Jenna Afarian - S3511312

# Wrote previous question WITH docstrings already.
# This code now simply includes doctests.
# Doctests run using python -m doctest -v q3.py

class Quack(object):
    """
    A class implementing a hybrid queue/stack.
    >>> q = Quack()
    >>> q.push(1)
    >>> q.push(2)
    >>> q.push(3)
    >>> q.push(4)
    >>> q.pop_end()
    4
    >>> q.pop_start()
    1
    """
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

    if __name__ == '__main__':
        import doctest
        doctest.testmod()
