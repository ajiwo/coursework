# 99 bottles of beer on the wall...

n = 99
line1 = ''
line2 = ''
while n > -1
  if n > 1
    line1 = "#{n} bottles of beer on the wall, #{n} bottles of beer."
    line2 = "Take one down and pass it around, #{n - 1} bottles of beer on the wall."
  end
  if n == 1
    line1 = "1 bottle of beer on the wall, 1 bottle of beer on the wall."
    line2 = "Take one down and pass it around, no more bottles of beer on the wall."
  end
  if n == 0
    line1 = "No more bottles of beer on the wall, no more bottles of beer."
    line2 = "Go to the store and buy some more, 99 bottles of beer on the wall."
  end
  puts line1
  puts line2
  puts "" 
  n = n - 1
end
