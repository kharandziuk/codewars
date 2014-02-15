pascalsTriangle = (num) ->
    triangle = [[1]]
    [1...num].forEach((rowNum) ->
        result = [0...rowNum].map (i) ->
            return 1 if i is 0
            return triangle[rowNum - 1][i-1] + triangle[rowNum - 1][i]
        result.push 1
        triangle.push result
    )
    cb = (sum, val) ->
        sum.concat val
    triangle.reduce cb, []

console.log pascalsTriangle(1)
console.log pascalsTriangle(2)
console.log pascalsTriangle(4)
