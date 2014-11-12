import unittest

def whatCentury(year):
    year = int(year)
    assert year < 10000 
    count = ((year - 1)/ 100) + 1
    if 10 < count < 14:
        suffix = 'th'
    else:
        suffix = {1: 'st', 2: 'nd', 3: 'rd'}.get(count % 10, 'th')
    return str(count) + suffix

class MyTestCase(unittest.TestCase):

    def test(self):
        self.assertEqual(whatCentury('1999'), '20th')
        self.assertEqual(whatCentury('2011'), '21st')
        self.assertEqual(whatCentury('2154'), '22nd')
        self.assertEqual(whatCentury('2259'), '23rd')
        self.assertEqual(whatCentury('1124'), '12th')
        self.assertEqual(whatCentury('2000'), '20th')



if __name__ == '__main__':
    unittest.main()
