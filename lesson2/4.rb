letters = ('a'..'z').to_a
vowel = ['a', 'e', 'i', 'o', 'u']
final = Hash.new
vowel.each do |letter|
  index = letters.find_index(letter)
  final[index + 1] = letter
end
puts final
