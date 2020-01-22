# prompt = TTY::Prompt.new

class Cli
    attr_reader :user
    def initialize(user)
        @user = user
    end

    def welcome_menu
        puts "Welcome #{user.name}"
        puts "Would you like to build a new grocery list? \n Please enter Yes or No"
        answer = gets.chomp

        if answer == "yes" 
            # show them the list of items
            puts "What is the name of the grocery list?"
            list_name = gets.chomp
            list1 = List.create(name: list_name)
            array = Item.all.map {|item| item.name}
            prompt = TTY::Prompt.new
            
            choices = prompt.multi_select("Please choose from list of popular household-grocery items below: \n", array)
            choices_array = choices.map {|item| item} 
            
            # final_choice_object = Item.all.select{|item| item.name == choices_array[0] || item.name == choices_array[1]}
            
            # final_choice_object.map {|choice| List_item.create(list: list1, item: choice)}
            
            # p choices_array
            binding.pry
        end
    end
end