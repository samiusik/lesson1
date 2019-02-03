puts "Введите год"
year = gets.to_i
puts "Введите месяц"
mounth = gets.to_i
puts "Введите день"
day = gets.to_i
days_in_month = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31,
}
mounths = (1..(mounth-1)).to_a
count = 0
mounths.each do |current_number|
  count += days_in_month[current_number]
end
count += day
count += 1 if year % 4 == 0 && (year % 400 == 0 || year % 100 != 0) && mounth >= 3
puts count
