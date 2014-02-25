stuff = {}

namespace = (root, path, value) ->
  parts = path.split('.')
  term = root
  parts[...-1].forEach((name)->
    term[name] = term[name] or {}
    term = term[name]
  )
  last = parts[parts.length]
  if value
    term[last] = value
    return root
  else
    return term[last]

namespace(stuff, 'moreStuff.name', 'the stuff')
console.assert namespace(stuff, 'moreStuff.name') is 'the stuff'
console.assert namespace(stuff, 'otherStuff.id') is undefined
