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