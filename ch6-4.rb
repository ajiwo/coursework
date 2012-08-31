#
# leap year

print "Start year: "
startyear = gets.chomp.to_i
print "End year: "
endyear = gets.chomp.to_i

y = startyear
while y <= endyear
  if y % 4 == 0
    if y % 100 == 0
      # divisable by 4 and 100
      if y % 400 == 0
        # divisable by 4 and 100 and 400
        puts y
      else
        # divisable by 4 and 100 but not 400
        # is not a leap year
      end
    else
      # divisable by 4 but not by 100
      puts y
    end
  else
    # not divisable by 4
  end
  y = y + 1
end
