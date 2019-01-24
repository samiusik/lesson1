puts "Как вас зовут?"
name = gets.chomp
puts "Укажите свой рост"
growth = gets.chomp
puts "Укажите свой вес"
weight = gets.chomp
ideal = growth.to_i - 110
	if ideal.to_i > growth.to_i
	print "Ваш вес уже оптимальный"
	end

puts "#{name}, привет! Ваш идеальный вес составляет #{growth.to_i - 110} кг."