class Cli
    attr_reader :user
    def initialize(user)
        @user = user
    end


    # HELPER: gets objects from selected choices
    def get_item_object_from_choices item_array
        item_objects = []
        item_array.each do |item|
            item_objects << Item.all.find {|each_item| each_item.name == item}
        end
        item_objects
    end


    # opening prompt that runs list creation. May change that! 
    def welcome_menu
        puts "Welcome #{user.name}"
        #for new lists
        list_creation
        add_items_to_most_current_list
    end


    # list creation prompt! Check zach's code for refactoring
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

    # Prompt used to decide which list you want to work in.
    def choose_list 
        puts "Do you have an existing list? Please enter Yes or No."
        answer = gets.chomp.downcase
        if answer == "yes"
            puts "Choose which list is yours"
            array = List.all.map {|list| list.name}
            prompt = TTY::Prompt.new
            list_choice = prompt.select("Please choose which list you would like to access: \n", array) 
            system"clear"
            decide_to_RUD(list_choice)
        end    
    end


    # HELPER: Read, update, delete.'Lots of other *helper* methods used here!
    def decide_to_RUD current_list
        puts "You working on the list: #{current_list}"
        prompt = TTY::Prompt.new
        rud_choice = prompt.select("Would you like read, update, or delete within #{current_list}? \n", ["Read list", "Add item", "Delete item"])
        
        system "clear"
        puts "You working on the list: #{current_list}"
        if rud_choice == "Read list"
            read_list(current_list)
        elsif rud_choice == "Add item"
            add_item
        elsif rud_choice == "Delete_item"
            delete_item
        end
    end

    
    # HELPER: for reading a list inside of decide_to_RUD, **takes and string!**
    def read_list(current_list)
        puts "List: showing #{current_list}"
        
        # Grabbing list id 
        current_list_id = find_chosen_list_id (current_list)

        # Grabbing list_items array from the current list id
        list_item_array = find_list_items (current_list_id)
        thing = get_list_item_id(list_item_array)
        raw_item_list = get_item_object_from_id(thing)
        list_of_names = get_name_from_item_list(raw_item_list)
        list_of_names.each_with_index do |item, index|
            puts "#{index+1}. #{item}"
        end
    end

    
    # HELPER: for read_list
    def find_list_items (id)
        List_item.all.select{|list_item| list_item.list_id == id}
    end
    
    def get_list_item_id (list_items)
        list_items.map{|item| item.item_id}
    end
    
    def get_item_object_from_id id_array
        item_objects = []
        id_array.each do |item|
            item_objects << Item.all.find {|each_item| each_item.id == item}
        end
        item_objects
    end
    
    def get_name_from_item_list (object_array)
        object_array.map {|object| object.name}
    end
    
    def find_chosen_list_id (list_array)
        List.all.find{|list| list.name == list_array}.id
    end

    
    # HELPER: for adding(update), Used in decide_to_RUD
    def add_item
        puts "adding item"
    end


    # HELPER: for deleting items in a list, used in decide_to_RUD.
    def delete_item
        puts "deleting item"
    end

end