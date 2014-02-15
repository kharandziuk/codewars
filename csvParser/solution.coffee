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

  result = []
  isTerm = true
  cb = (sum, val) ->
    lastRow = sum[sum.length - 1]
    if isTerm
      if val[0] is quote
        isTerm = false
        lastRow.push val
      else if '\n' in val
        parts = val.split('\n')
        if parts.length is 2
          [prev, next] = parts
          lastRow.push prev
          sum.push [next]
        else
          lastRow.push parts[0]
          parts[1..].forEach((el) ->
            if el is ''
              sum.push ['']
            else
              sum.push [el]
          )
      else
        lastRow.push val
    else
      last = val.length - 1
      if val[last] is quote and val[last-1] isnt val[last]
        isTerm = true
      lastRow.push val
    return sum
  input.split(separator).reduce(cb, [[]]).map((el) ->
    last = (arr) -> arr[arr.length - 1]
    while el[0] is last[el] is quote
      el = el[1...-1]
    return el
  )

a = '''a,b,c
d,e,f'''
b = '''one,"two ,wraps
onto ""two"" lines",three
4,,6'''

console.log parseCSV(a)
console.log parseCSV(b)
console.log parseCSV('1\t2\t3\n4\t5\t6', '\t')
#
#
console.log parseCSV('1,2,3\n\n4,5,6')
#Test Failed: Expected: [["1","2","3"],[""],["4","5","6"]], instead got: [["1","2","3"],["","5","6"]]
