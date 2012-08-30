puts 'First Name: '
first = gets.chomp
puts 'Middle Name: '
middle = gets.chomp
puts 'Last Name: '
last = gets.chomp

puts 'Howdy ' + first + ' ' + middle + ' ' + last + ' !'

puts 'What is your favourite number?'
fav = gets.chomp
fav_plus_one = 1 + fav.to_i
puts 'Your favourite number is: ' + fav.to_s + ', but i think ' + fav_plus_one.to_s + ' is bigger and better'
