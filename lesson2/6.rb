cart = {}
loop do 

  puts "Введите название товара. Введите 'Стоп' для окончания ввода"
  goods = gets.chomp
  if goods == "Стоп"
    break
  end
  puts "введите цену товара"
  price = gets.to_f
  puts "Введите количество товара"
  qty = gets.to_f
  cart[goods] = { price: price, qty: qty, total_price: price * qty } 
end
puts cart
total = 0
cart.each do |goods_name, hash|
  total += hash[:total_price]
end
puts total
