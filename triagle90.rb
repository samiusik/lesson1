triagle = {}
for i in 0..2
	puts "Введите #{i + 1} - ю сторону треугольника"
	triagle[i] = gets.chomp.to_f
end

if triagle[0] == triagle[1] or triagle[1] == triagle[2] or triagle [2] == triagle[0]
	triagle_ab = true
elsif triagle[0] == triagle[1] and triagle[1] == triagle[2]
	triagle_abc = true
end

triagle.sort
if triagle90 = triagle[0] ** 2 + triagle[1] ** 2 == triagle[2] **2
	triagle90 = true
end

	
if triagle90
	puts "Ваш треугольник прямоугольный"
elsif triagle90 and triagle_ab
	puts "Ваш треугольник прямоугольный и равнобедренный"
elsif triagle_ab
	puts "Ваш треугольник равнобедренный"
elsif triagle_abc
	puts "Ваш треугольник равносторонний"
elsif triagle_ab and triagle_abc
	puts "Ваш треугольник равнобедренный и равносторонний"
		
else
puts "У вас просто треугольник"
end