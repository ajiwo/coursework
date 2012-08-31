#

run = true
words = []

while run
  word = gets.chomp
  words.push word
  if word.length == 0
    run = false
  end
end

sorted = words.sort
puts sorted
