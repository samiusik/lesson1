total = 0
cart = {}
loop do
  puts "Введите название товара. Введите 'стоп' для окончания ввода"
  goods = gets.chomp
  if goods == "стоп"
    break
  end
  puts "введите цену товара"
  price = gets.to_f
  puts "Введите количество товара"
  qty = gets.to_f
  cart[goods] = { price: price, qty: qty } 
  total += price*qty
  puts "Добавлен продукт #{goods} с ценой #{price} в количестве #{qty} "
end
puts cart
puts "итоговая сумма: #{total}"
