puts "Введите значение а"
a = gets.chomp.to_f
puts "Введите значение b"
b = gets.chomp.to_f
puts "Введите значение c"
c = gets.chomp.to_f
d = (b ** 2) - (4.0 * a * c)
if d < 0
	puts "Дескриминант равен #{d}. Уравнение корней не имеет"
elsif d == 0
	puts "Дескриминант равен #{d}, уравнение имеет один корень равный #{-b / (2 ** a)}"
else
	dsqrt = Math.sqrt(d)
	puts "Дескриминант равен #{d}, уравнение имеет два корня: 
	Х1=#{(-b + dsqrt) / (2 * a)}
	X2=#{ (-b - dsqrt) / (2 * a)}"	
	end