require_relative './config/environment'
puts "Hello! Welcome to Grocery-Bot!"
puts "What's your name?"

user_name = gets.chomp

new_user = User.new(user_name)

cli = Cli.new(new_user)

cli.welcome_menu

binding.pry
0