assert = require 'assert'

# CSV Parser.  Takes a string as input and returns
# an array of arrays (for each row).
#
# @param input String, CSV input
# @param separator String, single character used to separate fields.
#        Defaults to ","
# @param quote String, single character used to quote non-simple fields.
#        Defaults to "\"".
parseCSV = (input, separator, quote) ->
  separator = separator || ','
  quote = quote || '"'

  reduce = Array.prototype.reduce

  depth = false
  getLast = (arr)->
    last = arr[arr.length - 1]
    return last
  accFunc = (acc, el, i, all)->
    if el is separator and not depth
      lastRow= getLast acc
      lastRow.push []
    else if el is quote and all[i+1] is quote
      if all[i+2] is separator
        return acc
      lastCell = getLast(getLast acc)
      lastCell.push el
    else if el is quote and all[i-1] is quote
        return acc
    else if el is quote
        depth = not depth
    else if el is '\n' and not depth
        acc.push [[]]
    else
      lastCell = getLast(getLast acc)
      lastCell.push el

    return acc

  reduce.call(input, accFunc, [[[]]])
    .map((row)->
      row.map((cell)->
        cell.join('')
      )
    )

a = '''a,b,c
d,e,f'''
b = '''one,"two ,wraps
onto ""two"" lines",three
4,,6'''

assert.deepEqual parseCSV('1\t2\t3\n4\t5\t6', '\t'), [ [ '1', '2', '3' ], [ '4', '5', '6' ] ]
assert.deepEqual parseCSV('1,2,3\n\n4,5,6'), [ [ '1', '2', '3' ], [""], [ '4', '5', '6' ]]
assert.deepEqual parseCSV(a), [[ 'a', 'b', 'c' ], [ 'd', 'e', 'f' ]]
assert.deepEqual parseCSV(b), [[ 'one', 'two ,wraps\nonto "two" lines', 'three'], [ '4', '', '6' ]]
#Test Failed: Expected: [[""]], instead got: [""]
assert.deepEqual parseCSV(''), [['']]
#Test Failed: Expected: [["1","","3"],["4","5",""],["","7","8"]], instead got: [["1","","3"],["4","5",""],["7","8"]]
assert.deepEqual parseCSV('1,,3\n4,5,\n,7,8'), [["1","","3"],["4","5",""],["","7","8"]]
#Test Failed: Expected: [["1","2","3"],[""],["4","5","6"]], instead got: [["1","2","3"],[],["4","5","6"]]
assert.deepEqual parseCSV('1,2,3\n\n4,5,6'), [["1","2","3"],[""],["4","5","6"]]
#Test Failed: Expected: [["1","","3"],["4","5","6"]], instead got: [["1","\"","3"],["4","5","6"]]
assert.deepEqual parseCSV('1,"",3\n4,5,6'), [["1","","3"],["4","5","6"]]
#Test Failed: Expected: [["1","two \"quote\"","3"],["4","5","6"]], instead got: [["1","two \"quote\"\",3\n4,5,6"]]
assert.deepEqual parseCSV('"""quote"""'), [['\"quote\"']]

