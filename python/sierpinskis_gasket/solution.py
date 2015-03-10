import unittest

def aux(board, size, left, top):
    if size is 1: 
        board[top][left] = 'L'
    else:
        offset = size / 2
        aux(board, offset, left, top)
        aux(board, offset, left, top + offset)
        aux(board, offset, left + offset, top + offset)
    return board


    
def sierpinski(n):
    size = 2 ** n
    board = [[' '] * size for x in xrange(size)]
    return '\n'.join(
        (''.join(el).replace(' ', '  ').replace('L', 'L ').strip() for el in aux(board, size, 0, 0))
    )

     


class MyTestCase(unittest.TestCase):

    def test(self):
        level0 = 'L'
        self.assertSequenceEqual(sierpinski(0),level0,"sierpinski(0)")
        level1 = '''
L
L L
        '''.strip()
        self.assertSequenceEqual(sierpinski(1),level1,)
        level2 = '''
L
L L
L   L
L L L L
        '''.strip()
        self.assertEquals(sierpinski(2),level2,)
        level3 = '''
L
L L
L   L
L L L L
L       L
L L     L L
L   L   L   L
L L L L L L L L
        '''.strip()
        self.assertEquals(sierpinski(3),level3,"sierpinski(3)")


if __name__ == '__main__':
    unittest.main()
