puts "Введите год"
year = gets.to_i
puts "Введите месяц"
mounth = gets.to_i
puts "Введите день"
day = gets.to_i
count_days = {
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
  count += count_days[current_number]
end
count += day

if year % 4 == 0 && (year % 400 == 0 || year % 100 != 0) && mounth >= 3
  count += 1
end

puts count
