# 00 01 02 03
# 10 11 12 13
# 20 21 22 23
# 30 31 32 33

snail = (array)->
    path=(start, end)->
        result = []
        return [] if start > end
        return [array[start][end]] if start is end

        for i in [start...end]
            result.push(array[start][i])
        for i in [start...end]
            result.push(array[i][end])
        for i in [end...start]
            result.push(array[end][i])
        for i in [end...start]
            result.push(array[i][start])
        return result.concat(
            path(start+1, end-1)
        )
    return path(0, array.length-1)



array = [[1]]
console.log 'res', snail(array) #[1,2,5,4])

array = [[1,2],
         [4,3]]
console.log 'res', snail(array) #[1,2,5,4])

array = [[1,2,3],
         [8,9,4],
         [7,6,5]]

console.log 'res', snail(array) #[1,2,3,4,5,6,7,8,9])
array = [[ 1, 2, 3, 4],
         [12,13,14, 5],
         [11,16,15, 6],
         [10, 9, 8, 7]]
