ranks = [-8..-1].concat [1..8]

class User
    constructor: ()->
        @rank = -8
        @progress = 0
        @_progress = 0

    incProgress: (activityRank) ->
        activityRank = ranks.indexOf(activityRank)
        if activityRank is -1
            throw Error
        rank =  ranks.indexOf(@rank)
        diff = activityRank - rank
        if diff is 0
            @_addProgress 3
        else if diff is -1
            @_addProgress 1
        else if diff < -1
            return
        else if diff > 0
            console.log 'there'
            @_addProgress 10 * diff * diff


    _addProgress: (points) ->
        @_progress += points
        @rank = ranks[Math.floor(@_progress / 100)]
        @progress = @_progress % 100
        if @rank is 8
            @progress = 0
            return

user = new User()
console.assert user.rank is -8
console.assert user.progress is 0
user.incProgress(-7)
console.log user._progress
console.assert user.progress is 10, user.progress # => 10
user.incProgress(-5) # will add 90 progress
console.assert user.progress is 0  # => 0 # progress is now zero
console.assert user.rank is -7 # => -7 # rank was upgraded to -7
user.incProgress(-9)
