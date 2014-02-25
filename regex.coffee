fstr= 'function (a, b) { return a + b; }'
fastr= 'function anonymous(a, b) { return a + b; }'

regex = /function(\s*)(anonymous)?\((?\*)/
match = regex
