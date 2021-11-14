input_array = ARGV

exit(1) if input_array.empty?

phrase = input_array.first

file_enum = File.foreach('/Users/varunb/.gitconfig')
file_enum.each_with_index do |line, index|
  puts "#{index} : #{line}" if line.include? phrase
end
