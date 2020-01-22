class Cli
    attr_reader :user
    def initialize(user)
        @user = user
    end

    def Start
        puts "Welcome to Grocery-Bot. Grocery-Bot allows you to add groceries to your grocery-list"
        puts "Lets get started, may I have your name?"
        
    end
    def welcome_menu
        puts "Welcome #{user.name}"
        puts "Would you like to build a new grocery list?"

        
    end

end