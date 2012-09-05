# orange tree

class OrangeTree
  def initialize
    @age = 0
    @maxAge = 20
    @height = 0
    @heightFactor = 0.6
    @orangeCount = 0
  end

  def height
    @height
  end

  def oneYearPasses
    @age = @age + 1
    if @age > @maxAge
      @orangeCount = 0
      return nil
    end

    @orangeCount = getOrangeCount
    @height = getHeight
  end

  def countTheOranges
    @orangeCount
  end

  def pickAnOrange
    if @orangeCount < 1
      return "No orange left for you to taste."
    end
    @orangeCount = @orangeCount - 1
    "Sweet and fresh!!" 
  end

  private
  def getHeight
    @heightFactor * @age
  end

  def getOrangeCount
    (@age - 1) * (@age - 2)
  end
end


#a = OrangeTree.new

#24.times do
#  a.oneYearPasses
#  print "#{a.countTheOranges} "
#end
#puts 

