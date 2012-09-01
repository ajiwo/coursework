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

# make copy
sorted = []
words.each do |w|
  sorted.push w
end

i = 0
l = sorted.length
tmp = nil
while i < l
  j = i + 1
  while j < l
    #puts sorted.join(', ')
    #puts "#{sorted[i]} -vs- #{sorted[j]}"
    if sorted[i].to_s > sorted[j].to_s
      tmp = sorted[i]
      sorted[i] = sorted[j]
      sorted[j] = tmp
      tmp = nil
      #puts "swap #{sorted[i]} <--> #{sorted[j]}"
      #puts sorted.join(', ')
    end
    #puts "--j--"
    j = j + 1
  end
  #puts "--i--"
  i = i + 1
end
#puts "============="
#puts sorted.join(', ')

puts sorted
