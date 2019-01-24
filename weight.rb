puts "Как вас зовут?"
name = gets.chomp
puts "Укажите свой рост"
growth = gets.chomp
puts "Укажите свой вес"
weight = gets.chomp
ideal = growth.to_i - 110.to_i
if ideal.to_i > weight.to_i
	puts "Ваш вес уже оптимальный"
else 
	puts "#{name}, привет! Ваш идеальный вес составляет #{growth.to_i - 110} кг."
end