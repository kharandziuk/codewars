import unittest

def copy_list(l):
    return list(l)

class MyTestCase(unittest.TestCase):

    def test(self):
        t = [1,2,3,4]
        t_copy = copy_list(t)
        self.assertSequenceEqual(t, t_copy)
        t[1] += 5
        self.assertNotEqual(t[1], t_copy[1])



if __name__ == '__main__':
    unittest.main()
