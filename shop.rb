# pawn shop, with discounts

# use the following cheat
# *  Array.delete_at
# *  String.start_with?
# *  method construct for more than one params: def foo(bar, baz)...end


# array of item
# item is an array with the format
# itemId, itemName, itemPrice
inventory = [ [ 1, 'A 1977 Apple II', 80 ],
              [ 2, 'A baseball signed by Babe Ruth', 50 ],
              [ 3, 'A copy of the 1974 game Oregon Trail', 10 ],
              [ 4, 'A Louisville Slugger owned by Babe Ruth', 500 ],
              [ 5, 'Complete set of Superman comic books', 100 ],
              [ 6, 'An original IBM Model M keyboard', 15 ],
              [ 7, "A paper copy of Chris Pine's Learn to Program book", 20 ],
              [ 8, 'A leaked pre-release iPhone 5', 5000 ] ]

# user shopping basket/cart
# has the same structure of inventory
basket = []

def showWelcome
  puts "\nWelcome to our shop, happy shopping"
end

def showContinue
  puts "Press ENTER to continue"
end

def showHints
  print "\nplease type a, r, l, v, c, or q followed by an ENTER"
  print "\n(a)dd, (r)emove, "
  print "\n(l)ist available,"
  print "\n(v)iew basket, "
  print "\n(c)heckout"
  print "\n(q)uit/abort\n=> "
end


def listItem inventory
  str = ''
  inventory.each do |item|
     str = str + "#{item[0]}. #{item[1]}: $#{item[2]}\n"
  end
  str
end

# end of program command
# used for 'clean exit' the program
eopStr = 'shutdown'

# user typed command
userCmd = ''

# add item with itemId from inventory to basket
def addToBasket(itemId, basket, inventory)
  # check if item exists in the inventory
  # if not return falsy
  found = false
  itemArray = []

  inventory.each do |element|
    if element[0] == itemId
      itemArray = element
      found = true
    end
  end
  if not found
    puts "failed: No such item"
    return false
  end
  # check if item exists in the basket
  # if yes return falsy
  found = false
  basket.each do |element|
    if element[0] == itemId
      puts "failed: Item already added"
      return false
    end
  end
  # store it to the basket
  basket.push itemArray
  listBasket basket
  true
end

# list basket content in a formatted way
def listBasket basket
  contents = ''
  basket.each do |item|
    contents = contents + "#{item[0]}. #{item[1]}: $#{item[2]}\n"
  end
  contents
end

# item based discount
def getPairedItemDiscount(basket, item1, item2, discount)
  found = []
  prices = []
  discounts = []
  basket.each do |item|
    if item[0] == item1
      found.push true
      prices.push item[2]
    elsif item[0] == item2
      found.push true
      prices.push item[2]
    end
  end
  if found[0] and found[1]
    discounts[0] = discount * prices[0]
    discounts[1] = discount * prices[1]
    return discounts[0] + discounts[1]
  end
  0
end

# quantity based discount
def getQtyDiscount(basket, price, discount)
  if basket.length > 2
    return price * discount
  end
  0
end

# get total price from a basket contents
def getTotalPrice basket
  total = 0
  basket.each do |item|
    total = total + item[2]
  end
  total
end

# summary of basket contents and sum of price
def basketSummary basket
  contentStr = listBasket basket
  totalPrice = getTotalPrice basket
  disc1 = getPairedItemDiscount(basket, 1, 3, 0.10)
  disc2 = getQtyDiscount(basket, totalPrice, 0.05)
  disc = disc1 + disc2
  discStr = ''
  if disc > 0
    discStr = "\ndiscount: $#{disc}"
    totalPrice = totalPrice - disc
  end
  # todo discount ?
  "#{contentStr}#{discStr}\nTotal cost: $#{totalPrice}"
end

# remove item with itemId from basket
def removeFromBasket(itemId, basket)
  index = 0
  # .length + 1 will make the array index out of
  # range so that .delete_at will fail and return nil
  indexFound = basket.length + 1
  basket.each do |element|
    if element[0] == itemId.to_i
      indexFound = index
    end
    index = index + 1
  end
  basket.delete_at(indexFound)
end

# checkout
# remove what basket contains from inventory
# then clear the basket
def checkout(basket, inventory)
  basket.each do |ib|
    iiFound = 0
    inventory.each do |ii|
      if ib[0] == ii[0]
        inventory.delete_at(iiFound)
      end
      iiFound = iiFound + 1
    end
  end
  basket.clear
end

showWelcome
# main program loop
while not (userCmd == eopStr)
  if userCmd == 'a'
    puts listItem(inventory)
    print "which item number? "
    itemId = gets.chomp.to_i
    if addToBasket(itemId, basket, inventory)
      puts "added item #{itemId}"
    end
    showContinue
  elsif userCmd == 'r'
    puts listBasket(basket)
    print "which item number? "
    itemId = gets.chomp.to_i
    if removeFromBasket(itemId, basket)
      puts "removed item #{itemId}"
    end
    showContinue
  elsif userCmd == 'l'
    puts listItem inventory
    showContinue
  elsif userCmd == 'v'
    puts "Your basket contents: "
    puts basketSummary(basket)
    showContinue
  elsif userCmd == 'c'
    if basket.length > 0
      puts "You're going to checkout the following item(s)"
      puts basketSummary basket
      print "Are you sure? "
      ans = gets.chomp.downcase
      if ans.start_with? 'y'
        puts "Thank you, please shop again"
        checkout(basket, inventory)
        showHints
      else
        puts "That's fine. keep shooping"
      end
    else
      puts "Your basket is empty. nothing to checkout"
    end
    showContinue
  elsif userCmd == 'q'
    print "Aborting all transaction. Are you sure? "
    ans = gets.chomp.downcase
    if ans.start_with? 'y'
      basket.clear
      showWelcome
      showHints
    else
      showContinue
    end
  else
    showHints
  end
  userCmd = gets.chomp.downcase
end

