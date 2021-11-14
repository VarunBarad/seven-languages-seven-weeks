animals = ['lions', 'tigers', 'bears']
transformed_array = {}
animals.each_with_index { |item, index| transformed_array[index] = item }
puts transformed_array

stuff = {
  array: [1, 2, 3],
  string: 'Hi, mom!'
}
transformed_hash = stuff.map { |key, value| [key, value] }
puts transformed_hash.inspect

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

[0, 1, 2, 3].each do |value|
  start_index = 4 * value
  a[start_index, 4].each do |ele|
    puts ele
  end
end
