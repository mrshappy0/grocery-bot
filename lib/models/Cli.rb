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

    def welcome_the_user
        system "clear"
        puts "\n\nWelcome "+ "#{user.name}!\n\n".colorize(:color=>:light_magenta)
    end
    # opening prompt that runs list creation. May change that! 
    def welcome_menu(exit_or_not="")
        while exit_or_not != "exit"
            system "clear"
            exit_or_not = choose_list
        end
        system "clear"
        puts "\n\n\n\n      🍆  🍉  🍄  🍕  🍤       Exiting Grocery-Bot! PS. Eat your veggies     🍤  🍕  🍄  🍉  🍆\n\n\n".colorize(:color=>:red).bold
        exit
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
                system "clear"
                puts "\n\n\n\n      🍆  🍉  🍄  🍕  🍤       Exiting Grocery-Bot! PS. Eat your veggies     🍤  🍕  🍄  🍉  🍆\n\n\n".colorize(:color=>:red).bold
                exit
            end
        elsif yes_no == "No"
            system "clear"
            puts "\n\n\n\n      🍆  🍉  🍄  🍕  🍤       Exiting Grocery-Bot! PS. Eat your veggies     🍤  🍕  🍄  🍉  🍆\n\n\n".colorize(:color=>:red).bold
            exit
        end
    end

    # Prompt used to decide which list you want to work in.
    def choose_list
        prompt = TTY::Prompt.new 
        array = ["Yes", "No", "Exit"]
        yes_no = prompt.select("\n\n\nDo you want to acces an" +" existing list?".colorize(:color=>:light_blue), array)
        if yes_no == "Yes"
            system "clear"
            array = List.all.map {|list| list.name}
            list_choice = prompt.select("\n\nPlease choose which" + " list".colorize(:color=>:light_blue) + " you would like to access: \n", array)
            system"clear"
            decide_to_RUD(list_choice)
            puts "\n\nIf you'd like to continue with grocery bot hit"+" enter-key".colorize(:color=>:red).bold + ". "+"Otherwise enter" +" exit".colorize(:color=>:red).bold
            exit_or_not = gets.chomp.downcase
        elsif yes_no == "No"
            system "clear"
            list_creation
        else
            system "clear"
            puts "\n\n\n\n      🍆  🍉  🍄  🍕  🍤       Exiting Grocery-Bot! PS. Eat your veggies     🍤  🍕  🍄  🍉  🍆\n\n\n".colorize(:color=>:red).bold
            exit 
        end
        exit_or_not    
    end


    # HELPER: Read, update, delete. Used in choose_list 'Lots of other *helper* methods used here!
    def decide_to_RUD current_list
        puts "\n\nYou are working within list  ".colorize(:color=>:magenta)+"------->  ".colorize(:color => :light_blue) + "#{current_list}\n\n".colorize(:color => :red).underline
        prompt = TTY::Prompt.new
        rud_choice = prompt.select("Choose whether you want to "+ "Create".colorize(:color => :light_blue) +", "+"Update".colorize(:color => :light_blue) + ", or" + " Delete an item ".colorize(:color => :light_blue) + "within #{current_list}? \n", ["Read list", "Add item", "Delete item", "Exit"])
        
        system "clear"
        puts "\n\nYou are working within list  "+"------->".colorize(:color=>:light_blue)+" #{current_list}".colorize(:color => :red).bold
        if rud_choice == "Read list"
            read_list(current_list)
        elsif rud_choice == "Add item"
            add_items_to_new_list
        elsif rud_choice == "Delete item"

            delete_item(current_list)
        else 
            system "clear"
            puts "\n\n\n\n      Exiting Bot!\n\n\n".colorize(:color=>:red).bold
            exit
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
        choices = prompt.multi_select("Please choose from the list of popular household-grocery items below: \n\n", array)
        puts "\n\n      Item's successfully added to list.".colorize(:color=>:light_red)+"😌  😌  😌"
        puts "\n                        🍴  🍛 "
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
        puts "\n\n          Items successfully deleted! Yehaw".coloriz(:color=>:light_red)
    end



end