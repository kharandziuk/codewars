solution = (list)->
    cb = (sum, val)->
        if sum.length is 0
            sum.push [val]
        else
            lastRange = sum[sum.length-1]
            last = lastRange[lastRange.length-1]
            if Math.abs(last - val) is
        return sum

    list.reduce(cb, [])

console.assert(
    solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) is
    "-6,-3-1,3-5,7-11,14,15,17-20",
    solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])
)
