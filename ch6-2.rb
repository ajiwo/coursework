#
# grandma

# loop condition
run = true

response = 'HUH?! SPEAK UP, SONNY!'
pretend = 'NO, NOT SINCE '
bye = 'BYE'

# initialize loop
hear = gets.chomp
while run
  # main loop body
  if hear == hear.upcase and hear.length > 0
    puts pretend + (1930 + rand(21)).to_s
  else
    puts response
  end
  # update loop condition
  hear = gets.chomp
  if hear == bye
    run = false
  end
end
