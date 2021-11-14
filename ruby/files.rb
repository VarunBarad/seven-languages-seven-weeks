file = File.open('/Users/varunb/.gitconfig')
# puts file.read
# file.readlines.map(&:chomp).each { |line| puts line }
file.close


file_enum = File.foreach('/Users/varunb/.gitconfig')
file_enum.each_with_index do |line, index|
  puts "#{index} : #{line}"
end
# puts file_data
