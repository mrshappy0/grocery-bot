List_item.destroy_all
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
List.create(name: "Breakfast List")
List.create(name: "Lunch List")
List.create(name: "Dinner List")
List.create(name: "Party List")
List.create(name: "Random List")

#Populate breakfast, lunch, dinner with items for examples

# Breakfast
List_item.where(list_id: 1).where(item_id: 2)
List_item.where(list_id: 1).where(item_id: 3)
List_item.where(list_id: 1).where(item_id: 4)
List_item.where(list_id: 1).where(item_id: 5)

# Lunch
List_item.where(list_id: 2).where(item_id: 6)
List_item.where(list_id: 2).where(item_id: 8)
List_item.where(list_id: 2).where(item_id: 9)

# Dinner
List_item.where(list_id: 3).where(item_id: 11)
List_item.where(list_id: 3).where(item_id: 13)
List_item.where(list_id: 3).where(item_id: 14)