# 00 01 02 03
# 10 11 12 13
# 20 21 22 23
# 30 31 32 33

snail = (array)->
    path=(start, end)->
        result = []
        if start is end
            result.push(array[i][j])
            return
        i=start
        for j in [start..end]
            console.log i, j
            result.push(array[i][j])
        console.log 'there1'
        j=end-1
        for i in [j-1..end]
            console.log i, j
            result.push(array[i][j])
        i=end-1
        console.log 'there2'
        for j in [i-1..start]
            console.log i, j
            result.push(array[i][j])
        j=start
        console.log 'there3'
        for i in [end-1..j+1]
            console.log i, j
            result.push(array[i][j])

        return result.concat(path(start+1, end-1))
    return path(0, array.length-1)


array = [[1,2,3],
         [4,5,6],
         [7,8,9]]
console.log snail(array) #=> [1,2,3,6,9,8,7,4,5]
#
#array = [[1,2,3],
#         [8,9,4],
#         [7,6,5]]
#console.log snail(array) #=> [1,2,3,4,5,6,7,8,9]
#array = [[ 1, 2, 3, 4],
#         [12,13,14, 5],
#         [11,16,15, 6],
#         [10, 9, 8, 7]]
#console.log snail(array) == [1..16]
