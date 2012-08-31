#
# grandma extended

# loop condition
run = true

response = 'HUH?! SPEAK UP, SONNY!'
pretend = 'NO, NOT SINCE '
bye = 'BYE'
bye_stop = 3

# initialize loop
hear = gets.chomp
bye_count = 0
while run
  # main loop body
  if hear == hear.upcase and 
     hear.length > 0 and
     hear != bye
    puts pretend + (1930 + rand(21)).to_s
  else
    puts response
  end
  # update loop condition
  hear = gets.chomp
  if hear == bye
    bye_count = bye_count + 1
  else
    bye_count = 0
  end
  if bye_stop == bye_count
    run = false
  end
end
