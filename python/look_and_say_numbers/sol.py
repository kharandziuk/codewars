import unittest

def look_and_say(data='1', maxlen=5):
    if maxlen is 0:
        return []
    result = []
    prev = None
    for x in data:
        if x != prev:
            result.append([])
        prev = x
        result[-1].append(x)
    result = ''.join((str(len(r)) + str(r[0]) for r in result))
    return [result] + look_and_say(result, maxlen - 1)




    


class MyTestCase(unittest.TestCase):

    def test(self):
        expected = ['11', '21', '1211', '111221', '312211', '13112221', '1113213211', '31131211131221', '13211311123113112211', '11131221133112132113212221']
        result = look_and_say('1', 10)
        self.assertEquals(result, expected)

        expected = ['111312', '31131112', '1321133112', '11131221232112', '31131122111213122112', '13211321223112111311222112', '1113122113121122132112311321322112', '311311222113111221221113122112132113121113222112']
        result = look_and_say('132', 8)
        self.assertEquals(result, expected)



if __name__ == '__main__':
    unittest.main()
