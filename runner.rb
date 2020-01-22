require_relative './config/environment'
puts "Welcome to Grocery-Bot. Grocery-Bot allows you to add groceries to your grocery-list"
puts "Lets get started, may I have your name?"

user_name = gets.chomp

user_new = User.new(user_name)

cli = Cli.new(user_new)
cli.welcome_menu

# binding.pry
0