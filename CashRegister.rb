# Create a cash register application that will
# Take in a cost of goods sold and cash given
# and will return the change to be given and
# the appropriate bills and coins to give
# ex:
# How much did it cost?
# 3.43
# How much did they pay?
# 10
# They get 6.57 in change
# 1 five, 1 one, 2 quarters, 1 nickle, 2 pennies
# Bonus:
# As a bonus, any time the change being returned ends in a 3,
# give the correct change but with random
# denominations instead of largest to smallest
# ex:
# ...
# They get 3.33 in change
# 1 one, 8 quarters, 2 dimes, 1 nickle, 8 pennies (this should be random, not this result)
require 'bigdecimal' #this allows for decimals in money

class Change
    attr_accessor :user_change, :user_paid, :item_cost, :denominations, :counter #setting up all of our variables
    def dolladollabillzyall(user_change) #our function that will loop through the user_change and calculate how many of each denomination to result in
        result = ""
        
        @denominations.each do |denomination|
            counter = 0 #we set this counter to 0 so that for each denomination (e.g. hundreds) we will restart at 0. this is supposed to be outside the while loop.
            while user_change >= denomination[:value] #here's our loop! this will compare our change with each denomination. if it's larger than the denomination, it will add 1 to the counter. example: if change is 175, it will accumulate 1 hundreds. Once the change is no longer greater than the denomination, it will move onto the next denomination. 
                user_change -= denomination[:value] #here we are subtracting the denomination from the user change. So, for chane = 175, we will subtract 1 hundred (100) from 175, and then start searching for 50 with change = 75.
                counter += 1 #this counts the number of bills/coins of each type
            end
            result << counter.to_s #this will print the number of denominations for each denomination 
            result << denomination[:money] #:money is the key in the denominations (i.e. the "hundreds", "fifties", etc. This will print the word next to the amount of each denominations. Thus, the line above will print "1" and this line will print "hundreds". )
    end
    result
    end

    def initialize #this function defines our change denominations  
        @denominations = []

        add_denomination(" hundreds, ", 100)
        add_denomination(" fifties, ", 50)
        add_denomination(" twenties, ", 20)
        add_denomination(" tens, ", 10)
        add_denomination(" fives, ", 5)
        add_denomination(" ones, ", 1)
        add_denomination(" quarters, ", 0.25)
        add_denomination(" dimes, ", 0.10)
        add_denomination(" nickels, ", 0.05)
        add_denomination(" pennies ", 0.01)

    end
    def add_denomination(money, value) #this defines the parts of information for denomination (i.e. name "hundreds" and value "100". This will come in handy with the above function and dividing our change into bills.)
        @denominations << {money: money, value: value}
    end
end

dolladollabillzyall = Change.new

#this is our main space where we ask the user for information. 
puts "How much did the item cost?"
@item_cost = BigDecimal.new(gets.chomp)
puts "How much did you pay?"
@user_paid = BigDecimal.new(gets.chomp)
@user_change = (@user_paid - @item_cost)
puts "Your change is: $#{@user_change.to_s('F')}"

puts dolladollabillzyall.dolladollabillzyall(@user_change) #holla! 
 #user_paid is the amount the user paid
    #     #item_cost is how much the item cost
    #     # user_change is the change that the user will receive
    #     #we want this function to calculate this every time we ask 

# temp_change = Change.new
# puts temp_change.initialize(user_change)

#Change.denominations = []

