### Delete all current entries in :recipes table
Recipe.delete_all

### FAKER ###
40.times do
	rand_user = Random.new.rand(1..7) #[user_ninja3487, user_snake117, user_sgomez, user_amarino, user_tswift, user_jzuniga].sample

	prep_time_intervals = (0..180).step(2).to_a
	prep_time_intervals.shift
	rand_prep_time_duration = prep_time_intervals.sample
	if rand_prep_time_duration < 10
		rand_prep_time_unit = ["min", "hr"].sample
	else
		rand_prep_time_unit = "min"
	end

	cooking_time_intervals = (0..180).step(2).to_a
	cooking_time_intervals.shift
	rand_cooking_time_duration = cooking_time_intervals.sample
	if rand_cooking_time_duration < 10
		rand_cooking_time_unit = ["min", "hr"].sample
	else
		rand_cooking_time_unit = "min"
	end

	shelf_time_intervals = (0..180).step(2).to_a
	shelf_time_intervals.shift
	rand_shelf_time_duration = shelf_time_intervals.sample
	if rand_shelf_time_duration < 10
		rand_shelf_time_unit = ["min", "hr"].sample
	else
		rand_shelf_time_unit = "min"
	end

	serving_size_interval = (1..15).to_a
	serving_size_unit_options = ["g", "oz", "cup", "plate"]
	rand_serving_size_value = serving_size_interval.sample
	rand_serving_size_unit = serving_size_unit_options.sample

	rand_approx_cost = rand(12.95..315.99)

	rand_difficulty_level = [1, 2, 3, 4].sample

	rand_num = (1..5).to_a.sample

	if rand_num == 1
		rand_recipe_id = (100000..199999).to_a.sample
		insert_recipe_link = "http://www.allrecipes.com/#{rand_recipe_id}"
	elsif rand_num == 2
		rand_allergen_num = (10..99).to_a.sample
		insert_other_allergen = "Allergen #{rand_allergen_num}"
	elsif rand_num == 3
		rand_recipe_id = (100000..199999).to_a.sample
		insert_recipe_link = "http://www.allrecipes.com/#{rand_recipe_id}"
		rand_allergen_num = (10..99).to_a.sample
		insert_other_allergen = "Allergen #{rand_allergen_num}"
	else
		insert_recipe_link = nil
	end

	food_images_array = [
		"Apple-cobbler-with-a-white-jug-of-toffee-sauce-with-vanilla-ice-cream.jpg",
		"Cauliflower-soup-with-garnish-of-fried-cauliflower-florets-olive-oil-and-parsley.jpg",
		"Chicken-curry-and-rice-aperitifs-with-nan-bread-yogurt-raita-and-coriander.jpg",
		"Chicken-Donburi-with-paprika-egg-and-onion.jpg",
		"Chicken-salad-with-crispy-potato-croquets-beat-root-and-mint-leaves-pomegrante-seeds-chick-peas.jpg",
		"Chicken-with-bacon-rosemary-and-dill.jpg",
		"Cotoletta-alla-bolognese-breaded-schnitzel-with-raw-ham-and-parmesan-Italy.jpg",
		"Fish-and-chips-battered-cod-with-chunky-chips-a-slice-of-lemon-a-pot-of-Tartare-sauce.jpg",
		"fish-avocado-eggs.jpg",
		"Fish-fingers-in-a-seeded-roll-with-lettuce-coleslaw-lemon-wedge.jpg",
		"Four-jam-tart.jpg",
		"Homemade-vegetarian-Pizza-with-sourdough-crust-mozzarella-cheese-tomato-and-basil.jpg",
		"kiwi-with-drink.jpg",
		"mango-crumble.jpg",
		"Ossobuco-con-la-gremolata-braised-veal-slice-Italy.jpg",
		"Pan-pizza-with-hummus-and-grilled-vegetables.jpg",
		"Pici-with-garlic-artichokes-and-almonds.jpg",
		"Pork-ribs-with-lemon-mustard-and-thyme.jpg",
		"Salmon-fillet-on-a-bed-of-samphire-green-lentles-and-tomatoes-with-a-green-herb-vinegarette.jpg"
	]
	recipe_image = food_images_array.sample

	# PATH: /Users/neema/Dropbox/Caliber/seed_images/#{FILE_NAME}.jpg
	recipe_image_path = {io: File.open(Rails.root.join("/Users/neema/Dropbox/Caliber/seed_images/food_images", recipe_image)), filename: recipe_image, content_type: "image/jpg"}

	# :dairy, :eggs, :fish, :crustacean_shellfish, :tree_nuts, :peanuts, :wheat, :soybeans, :other
	Recipe.create!(title: Faker::Food.unique.dish,
		log_line: Faker::Lorem.words(5..7).join(" ").titleize,
		description: Faker::Food.description,
		recipe_link: insert_recipe_link,
		meal_type: ["Breakfast & Brunch", "Lunch", "Dinner", "Dessert"].sample,
		main_ingredient: ["Beef", "Beans & Legumes", "Chicken", "Chocolate", "Fruit", "Game Meats", "Grains", "Pasta/Noodles", "Pork", "Potatoes", "Poultry", "Rice", "Salmon", "Seafoods", "Shrimp", "Tofu & Tempeh", "Turkey", "Vegetable"].sample,
		diet_and_health: ["Diabetic", "Low Carb", "Gluten Free", "Heart-Healthy", "Low Calorie", "Low Cholesterol", "Low Fat", "Weight-Loss"].sample,
		seasonal: ["Christmas", "Thanksgiving", "Mardi Gras", "4th of July", "New Year", "Labor Day", "Memorial Day", "Ramadan", "Oktoberfest", "Diwali", "Valentine's Day", "Easter", "Passover", "Cinco de Mayo", "St. Patrick's Day"].sample,
		dish_type: ["Appetizers", "Breads", "Cakes, Cookies, Candies & Fudge", "Casseroles", "Cocktails", "Pastas", "Pies", "Pizzas", "Sandwiches", "Sauces and Condiments", "Smoothies & Shakes", "Soups, Stews, and Chili"].sample,
		cooking_style: ["BBQ & Grilling", "Budget Cooking", "Cooking for Kids", "Cooking for Two", "Gourmet", "Paleo", "Pressure Cooker", "Quick & Easy", "Slow Cooker", "Vegan", "Vegetarian"].sample,
		world_cuisine: ["African", "Chinese", "Indian", "Italian", "Latin", "Middle Eastern", "Southern", "Thai", "U.S.", "Japanese", "Korean", "French", "European"].sample,
		prep_time_value: rand_prep_time_duration,
		prep_time_unit: rand_prep_time_unit,
		cooking_time_value: rand_cooking_time_duration,
		cooking_time_unit: rand_cooking_time_unit,
		shelf_life_value: rand_shelf_time_duration,
		shelf_life_unit: rand_shelf_time_unit,
		serving_size_value: rand_serving_size_value,
		serving_size_unit: rand_serving_size_unit,
		approximate_cost: rand_approx_cost,
		difficulty_level: rand_difficulty_level,
		notes: Faker::Lorem.paragraphs(7..10).join(" "),
		dairy: [true, false].sample,
		eggs: [true, false].sample,
		fish: [true, false].sample,
		crustacean_shellfish: [true, false].sample,
		tree_nuts: [true, false].sample,
		peanuts: [true, false].sample,
		wheat: [true, false].sample,
		soybeans: [true, false].sample,
		other: insert_other_allergen,
		# ingredient_attributes: [],
		# direction_attributes: [],
		user_id: rand_user).recipe_images.attach(recipe_image_path)



	# Recipe.create!(title: Faker::Lorem.words(5..7).join(" ").titleize,
	# 	log_line: Faker::Lorem.words(5..7).join(" ").titleize,
	# 	description: Faker::Lorem.paragraphs(10..12).join(" "),
	# 	recipe_link: insert_recipe_link,
	# 	meal_type: ["Breakfast & Brunch", "Lunch", "Dinner", "Dessert"].sample,
	# 	main_ingredient: ["Beef", "Beans & Legumes", "Chicken", "Chocolate", "Fruit", "Game Meats", "Grains", "Pasta/Noodles", "Pork", "Potatoes", "Poultry", "Rice", "Salmon", "Seafoods", "Shrimp", "Tofu & Tempeh", "Turkey", "Vegetable"].sample,
	# 	diet_and_health: ["Diabetic", "Low Carb", "Gluten Free", "Heart-Healthy", "Low Calorie", "Low Cholesterol", "Low Fat", "Weight-Loss"].sample,
	# 	seasonal: ["Christmas", "Thanksgiving", "Mardi Gras", "4th of July", "New Year", "Labor Day", "Memorial Day", "Ramadan", "Oktoberfest", "Diwali", "Valentine's Day", "Easter", "Passover", "Cinco de Mayo", "St. Patrick's Day"].sample,
	# 	dish_type: ["Appetizers", "Breads", "Cakes, Cookies, Candies & Fudge", "Casseroles", "Cocktails", "Pastas", "Pies", "Pizzas", "Sandwiches", "Sauces and Condiments", "Smoothies & Shakes", "Soups, Stews, and Chili"].sample,
	# 	cooking_style: ["BBQ & Grilling", "Budget Cooking", "Cooking for Kids", "Cooking for Two", "Gourmet", "Paleo", "Pressure Cooker", "Quick & Easy", "Slow Cooker", "Vegan", "Vegetarian"].sample,
	# 	world_cuisine: ["African", "Chinese", "Indian", "Italian", "Latin", "Middle Eastern", "Southern", "Thai", "U.S.", "Japanese", "Korean", "French", "European"].sample,
	# 	prep_time_value: rand_prep_time_duration,
	# 	prep_time_unit: rand_prep_time_unit,
	# 	cooking_time_value: rand_cooking_time_duration,
	# 	cooking_time_unit: rand_cooking_time_unit,
	# 	shelf_life_value: rand_shelf_time_duration,
	# 	shelf_life_unit: rand_shelf_time_unit,
	# 	serving_size_value: rand_serving_size_value,
	# 	serving_size_unit: rand_serving_size_unit,
	# 	approximate_cost: rand_approx_cost,
	# 	difficulty_level: rand_difficulty_level,
	# 	notes: Faker::Lorem.paragraphs(7..10).join(" "),
	# 	dairy: [true, false].sample,
	# 	eggs: [true, false].sample,
	# 	fish: [true, false].sample,
	# 	crustacean_shellfish: [true, false].sample,
	# 	tree_nuts: [true, false].sample,
	# 	peanuts: [true, false].sample,
	# 	wheat: [true, false].sample,
	# 	soybeans: [true, false].sample,
	# 	other: insert_other_allergen,
	# 	user_id: rand_user)
end

puts "Recipes successfully seeded!"
puts "There are now #{Recipe.count} rows in the recipes table."
Recipe.reindex
puts "Reindexed: Recipe"
