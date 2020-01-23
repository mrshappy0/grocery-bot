require_relative './config/environment'
puts "Welcome to Grocery-Bot. Grocery-Bot allows you to add groceries to your grocery-list"
puts "Lets get started, may I have your name?"

user_name = gets.chomp

user_new = User.new(user_name)

cli = Cli.new(user_new)

cli.welcome_menu


<<<<<<< HEAD
binding.pry
0 
=======
# binding.pry
0
>>>>>>> cfd97976b4f24fbee9342adf83b56a31633db24b
