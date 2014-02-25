generateHashtag = (str) ->
    return false if str.length > 140 or not str.length
    parts = str.trim().split(' ').map (x) -> x[0].toUpperCase() + x[1..-1]
    "##{parts.join('')}"



console.log generateHashtag(" Hello World ")
console.log generateHashtag("Hello there thanks for trying my Kata")
