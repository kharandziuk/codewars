import unittest

class List(list):
    def __init__(self, l):
        l = [x for x in l if isinstance(x, int)]
        super(List, self).__init__(l)

    def even(self):
        return List(x for x in self if x % 2 == 0)
    def odd(self):
        return List(x for x in self if x % 2 != 0)
    def under(self, border):
        return List(x for x in self if x < border)
    def over (self, border):
        return List(x for x in self if x > border)
    def in_range (self, l, h):
        return List(x for x in self if x >= l and x <= h)

def list(l):
    return List(l)



class MyTestCase(unittest.TestCase):

    def test(self):
        self.assertListEqual(list([1,2,3,4,5]).even(), [2,4])
        self.assertListEqual(list([1,2,3,4,5]).odd(), [1,3,5])
        self.assertListEqual(list([1,2,3,4,5]).under(4), [1,2,3])
        self.assertListEqual(list([1,2,3,4,5]).over(4), [5])
        self.assertListEqual(list([1,2,3,4,5]).in_range(1, 3), [1,2,3])

if __name__ == '__main__':
    unittest.main()
