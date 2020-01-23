# prompt = TTY::Prompt.new

class Cli
    attr_reader :user
    def initialize(user)
        @user = user
    end

    def get_item_object_from_choices item_array
        item_objects = []
        item_array.each do |item|
            item_objects << Item.all.find {|each_item| each_item.name == item}
        end
        item_objects
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
            grocery_objects = get_item_object_from_choices (choices)
            
            grocery_objects.map {|choice| List_item.create(list: list1, item: choice)}

            binding.pry
        end
    end
end