#

run = true
words = []

while run
  word = gets.chomp

  if word.length > 0
    words.push word
  else
    run = false
  end
end

sorted = words.sort
puts sorted
