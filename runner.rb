require_relative './config/environment'
puts "\n\n      🍆  🍉  🍄  🍕  🍤       Welcome to Grocery-Bot!     🍤  🍕  🍄  🍉  🍆   \n\n".colorize(:color => :light_blue,)
puts "      Grocery-bot".colorize(:color => :magenta) + " is a minimalistic terminal app for creating grocery lists.\n      You will be able to "+"Create".colorize(:color => :light_blue) +", "+"Update".colorize(:color => :light_blue) + ", and" + " Delete items".colorize(:color => :light_blue) + " in your shopping list.\n\n"
puts "      What name would you like to be identified by?\n\n".colorize(:color=>:red).bold

# binding.pry
user_name = gets.chomp


user_new = User.new(user_name)

cli = Cli.new(user_new)

cli.welcome_the_user
puts "      Hit "+"enter".colorize(:color=>:light_blue)+" to continue or "+"exit".colorize(:color=>:light_blue)+" to leave:"
variable = gets.chomp.downcase
if variable != "exit" 
elsif variable == "exit"
    system "clear"
    puts "\n\n\n\n      🍆  🍉  🍄  🍕  🍤       Exiting Grocery-Bot! PS. Eat your veggies     🍤  🍕  🍄  🍉  🍆\n\n\n".colorize(:color=>:red).bold
    exit
end
cli.welcome_menu



0 
