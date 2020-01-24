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
    def welcome_menu(exit_or_not="")
        system "clear"
        puts "\n\nWelcome "+ "#{user.name}!\n\n".colorize(:color=>:light_magenta)
        while exit_or_not != "exit"
            exit_or_not = choose_list
        end
    end

    # list creation prompt! Check zach's code for refactoring
    def list_creation
        prompt = TTY::Prompt.new
        array = ["Yes", "No"]
        yes_no = prompt.select("\n\nWould you like to build a new grocery list?", array)
        if yes_no == "Yes" 
            system "clear"
            puts "\n\nWhat is the name of the grocery list?"
            list_name = gets.chomp.downcase
            if list_name != "exit"
                puts "\n\nYou are working within new list  "+"------->".colorize(:color=>:light_blue)+" #{list_name}\n\n".colorize(:color => :red).bold
                list1 = List.create(name: list_name)
                add_items_to_new_list
                decide_to_RUD(List.last.name)
            elsif list_name == "exit"
                exit
            end
        elsif yes_no == "No"
            system "clear"
            puts "\n\nMy work is done here, Thank you!\n\n\n"
            exit
        end
    end

    # Prompt used to decide which list you want to work in.
    def choose_list
        prompt = TTY::Prompt.new 
        array = ["Yes", "No"]
        yes_no = prompt.select("Do you have an existing list?", array)
        if yes_no == "Yes"
            system "clear"
            array = List.all.map {|list| list.name}
            list_choice = prompt.select("\n\nPlease choose which list you would like to access: \n", array)
            system"clear"
            decide_to_RUD(list_choice)
            puts "do you want to exit? Enter exit if you want to"
            exit_or_not = gets.chomp.downcase
        elsif yes_no == "No"
            system "clear"
            list_creation
        end
        exit_or_not    
        # binding.pry
    end


    # HELPER: Read, update, delete. Used in choose_list 'Lots of other *helper* methods used here!
    def decide_to_RUD current_list
        puts "\n\nYou are working within list  "+"------->".colorize(:color=>:light_blue)+" #{current_list}\n\n".colorize(:color => :red).bold
        prompt = TTY::Prompt.new
        rud_choice = prompt.select("Would you like read, update, or delete within #{current_list}? \n", ["Read list", "Add item", "Delete item"])
        
        system "clear"
        puts "\n\nYou are working within list  "+"------->".colorize(:color=>:light_blue)+" #{current_list}\n\n".colorize(:color => :red).bold
        if rud_choice == "Read list"
            read_list(current_list)
        elsif rud_choice == "Add item"
            add_items_to_new_list
        elsif rud_choice == "Delete item"

            delete_item(current_list)
        end
    end

    def read_list(current_list)        
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

    
    # HELPER: needs a comment 
    def read_list_for_delete(current_list)
        
        # Grabbing list id 
        current_list_id = find_chosen_list_id (current_list)

        # Grabbing list_items array from the current list id
        list_item_array = find_list_items (current_list_id)
        thing = get_list_item_id(list_item_array)
        raw_item_list = get_item_object_from_id(thing)
        list_of_names = get_name_from_item_list(raw_item_list)
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

    
    # HELPER: for adding(update), Used in decide_to_RUD, and list_creation
    def add_items_to_new_list
        array = Item.all.map {|item| item.name}
        prompt = TTY::Prompt.new
        choices = prompt.multi_select("Please choose from list of popular household-grocery items below: \n", array)
        puts "\n\nItem's successfully added to list.".colorize(:color=>:light_red)
        grocery_objects = get_item_object_from_choices (choices)
        grocery_objects.map {|choice| List_item.create(list: List.last, item: choice)}
    end


    # HELPER: for deleting items in a list, used in decide_to_RUD.
    def delete_item (list)
        array = read_list(list)
        #array should be made from database that corresponds to the list being passed in.
        prompt = TTY::Prompt.new
        choices = prompt.multi_select("Select which item you would like to delete: \n", array)
        grocery_objects = get_item_object_from_choices (choices)
        list_id = find_chosen_list_id(list)
        grocery_objects.map {|item| List_item.where(list_id: list_id).where(item_id: item.id)}
        puts "Items successfully deleted! Yehaw".coloriz(:color=>:light_red)
    end



end