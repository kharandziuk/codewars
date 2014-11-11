import unittest

def Ackermann(m, n):
    assert m >= 0, m
    assert n >= 0, n
    if m is 0:
        return n + 1
    if m > 0 and n is 0:
        return Ackermann(m-1, 1)
    if m > 0 and n > 0:
        return Ackermann(m - 1, Ackermann(m, n - 1))
    

class MyTestCase(unittest.TestCase):

    def test(self):
        self.assertEquals(Ackermann(1,1), 3);
        self.assertEquals(Ackermann(4,0), 13);


if __name__ == '__main__':
    unittest.main()
