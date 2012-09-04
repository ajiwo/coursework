# happy birthday

puts "When you were born?"

print "year: "
yob = gets.chomp

print "month: "
mob = gets.chomp

print "day: "
dob = gets.chomp


now = Time.new
born = Time.mktime(yob, mob, dob)
age = (now.to_i - born.to_i) / (3600 * 24 * 365)

puts "Well, you are #{age} years old."

i = 0
while i < age
  puts "SPANK!"
  i = i + 1
end

