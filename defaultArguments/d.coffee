defaultArguments = (func, params)->
    pars = func.toString()
        .replace(/\n/g, '')
        .replace('function (', '')
        .split(')')[0]
        .split(',')
        .map((x) -> params[x.trim()])
    return (args...)->
        for i in [0...pars.length]
            args[i] = pars[i] if not args[i]?
        if (args.filter (x) -> x?).length != pars.length
            return undefined
        func.apply({}, args)

add = (a, b) -> a + b

add_ = defaultArguments(add, {b: 9})
console.assert add_(10) is 19
console.assert add_(10, 7) is  17
console.assert add_() is undefined

add_ = defaultArguments(add_, {b: 3, a: 2})
console.assert (add_ 10) is 13, add_ (10)
console.assert add_() is 6, add_()

add_ = defaultArguments(add_, {c:3}) # doesn't do anything, since c isn't an argument of add_
console.assert (add_ 10)  is undefined# returns undefined
console.assert (add_ 10, 10) is 20
