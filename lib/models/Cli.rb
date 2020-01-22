class Cli
    attr_reader :user
    def initialize(user)
        @user = user
    end

    def welcome_menu
        puts "Welcome #{user.name}"
        puts "Would you like to build a new grocery list?"

        
    end

end