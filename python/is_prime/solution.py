import unittest
import math

def is_prime(n):
    if n < 2:
        return False 
    border = int(math.sqrt(n))
    print border
    for x in xrange(2, border + 1):
        if n % x == 0:
            return False
    return True

class MyTestCase(unittest.TestCase):

    def test(self):
        self.assertFalse(is_prime(0))
        self.assertFalse(is_prime(1))
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(11))
        self.assertFalse(is_prime(12))
        self.assertTrue(is_prime(571))
        self.assertFalse(is_prime(25))



if __name__ == '__main__':
    unittest.main()
