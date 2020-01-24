ListItem.destroy_all
Item.destroy_all
List.destroy_all


# Breakfast
milk = Item.create(name: "Milk")
eggs = Item.create(name: "Eggs")
bread = Item.create(name: "Bread")
bacon = Item.create(name: "Bacon")
oj = Item.create(name: "Orange Juice")

# Lunch
sliced_cheddar = Item.create(name: "Sliced Cheddar")
chips = Item.create(name: "Chips")
clif_bar = Item.create(name: "Clif Bar")
gatorade = Item.create(name: "Gatorade")
deli_meat = Item.create(name: "Deli Meat")

# Dinner Foods
mashed_taters = Item.create(name: "Mashed Taters")
grilled_chicken = Item.create(name: "Grilled Chicken")
mixed_veggies = Item.create(name: "Mixed Veggies")
ground_beef_buns = Item.create(name: "Ground Beef & Buns")
salmon_rice = Item.create(name: "Salmon and Rice")

# Create Default List_items and List so choosing from a existing list doesn't cause erros
list1 = List.create(name: "Breakfast List")
list2 = List.create(name: "Lunch List")
list3 = List.create(name: "Dinner List")
list4 = List.create(name: "Party List")
list5 = List.create(name: "Random List")

#Populate breakfast, lunch, dinner with items for examples

# Breakfast
ListItem.create(list: list1, item: oj)
ListItem.create(list: list1, item: eggs)
ListItem.create(list: list1, item: bacon)
ListItem.create(list: list1, item: bread)

# Lunch
ListItem.create(list: list2, item: sliced_cheddar)
ListItem.create(list: list2, item: deli_meat)
ListItem.create(list: list2, item: bread)

# Dinner
ListItem.create(list: list3, item: mashed_taters)
ListItem.create(list: list3, item: grilled_chicken)
ListItem.create(list: list3, item: mixed_veggies)