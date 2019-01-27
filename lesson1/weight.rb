puts "Как вас зовут?"
name = gets.chomp
puts "Укажите свой рост"
growth = gets.to_i
puts "Укажите свой вес"
weight = gets.to_i
ideal = growth - 110
if ideal > weight
  puts "Ваш вес уже оптимальный"
else
  puts "#{name}, привет! Ваш идеальный вес составляет #{ideal} кг."
end
