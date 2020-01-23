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
        #for new lists
        list_creation
        add_items_to_most_current_list
    end

    
    def list_creation
        puts "Would you like to build a new grocery list? \n Please enter Yes or No"
        answer = gets.chomp.downcase
        if answer == "yes" 
            puts "What is the name of the grocery list?"
            list_name = gets.chomp.downcase
            list1 = List.create(name: list_name)
        elsif answer == "no"
            puts "My work is done here, Thank you!"
            exit
        else
            puts "That is not a valid command"
        end
    end

    def add_items_to_most_current_list
        array = Item.all.map {|item| item.name}
        prompt = TTY::Prompt.new
        choices = prompt.multi_select("Please choose from list of popular household-grocery items below: \n", array)
        grocery_objects = get_item_object_from_choices (choices)
        grocery_objects.map {|choice| List_item.create(list: List.all.last, item: choice)}
    end
end