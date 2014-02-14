defaultArguments = (func, params)->
    parts = func.toString()
        .replace(/\n/g, '')
        .replace(/function (\w)*\(/, '')
        .split(')')
    body = parts[1..].join(')')[...-1]
        .replace('{', '')
    argsNames = parts[0]
        .split(',').map( (x) -> x.trim())
    body = argsNames.map((n) ->
        "if( #{n} === undefined){ return undefined; }").join(';') + ';' + body
    for k, v of params
        if k in argsNames
            body = "#{k} = #{k} || #{v};" + body
    return new Function(argsNames, body)

add = (a, b) -> a + b

add_ = defaultArguments(add, {b: 9})
console.assert add_(10) is 19, add_(10) # returns 19
console.assert add_(10, 7) is 17, add_(17)# returns 17
console.assert add_() is undefined, add_() # returns undefined

add_ = defaultArguments(add_, {b: 3, a: 2})
console.assert add_(10) is 13, add_(10)# returns 13 now
console.assert add_() is 5, add_() # returns 5

add_ = defaultArguments(add_, {c:3}) # doesn't do anything, since c isn't an argument of add_
console.assert(add_(10) is undefined)  # returns undefined
console.assert(add_(10, 10) is 20) # returns 20
