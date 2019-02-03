default = [ 1, 1 ]
fibo = default [0] + default [1]
while fibo <= 100
  default.push(fibo)
  fibo += default[-2]
end
puts default
