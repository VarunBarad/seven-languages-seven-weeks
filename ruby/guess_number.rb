x = rand(10)

while true
  puts 'make a guess'
  guess = gets().to_i
  if x == guess
    puts 'you got it'
    break
  else
    if x < guess
      puts 'try a bit lower'
    else 
      puts 'try a bit higher'
    end
  end
end

puts 'tada, you are done'
