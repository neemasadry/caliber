
Guide.destroy_all

tag_list_options = ["fashion", "entrepreneurship", "business", "productivity", "leadership", "dating", "romance", "date night", "promotion", "career", "diet", "eating", "home decor", "stress management", "style", "hygiene", "grooming", "beauty", "makeup tutorial", "product list", "supplements", "weight loss", "muscle building", "nutrition"]

40.times do
	rand_category = ['Men', 'Women', 'Relationships', 'Home Care', 'Health'].sample
	if (rand_category == "Men")
		rand_one = ['Fashion', 'Fragrances', 'Gear', 'Grooming', 'Hobbies', 'Lifestyle', 'Skills', 'Style'].sample
	elsif (rand_category == "Women")
		rand_one = ['Beauty', 'Fashion', 'Fragrances', 'Gear', 'Hobbies', 'Lifestyle', 'Skills', 'Style'].sample
	elsif (rand_category == "Home Care")
		rand_one = ['Cleaning', 'Entertainment', 'Home Decor', 'Hospitality', 'Organization', 'Outdoors'].sample
	elsif (rand_category == "Relationships")
		rand_one = ['Dating', 'Family', 'Friends', 'Professional'].sample
	elsif (rand_category == "Health")
		rand_one = ['Diet', 'Fitness & Exercise', 'Wellness', 'Workouts'].sample
		if (rand_one == "Diet")
			rand_two = ['Nutrition', 'Supplements'].sample
		elsif (rand_one == "Wellness")
			rand_two = ['Confidence & Motivation', 'Stress Management', 'Spiritual'].sample
		end
	end

	rand_user = Random.new.rand(1..8)
	get_user = User.find(rand_user)

	if rand_user == 3 || rand_user == 5 || rand_user == 7 || rand_user == 8
		user_has_multiple_accounts = true

		personal_or_brand = Random.new.rand(1..2)

		if personal_or_brand == 1
			rand_user_account = get_user.accounts.where(personal: true).first
		else
			user_accounts = get_user.accounts.where(personal: false)

			rand_user_account = user_accounts.sample
			rand_user_account_brand = rand_user_account.brand
		end

	else
		user_has_multiple_accounts = false
		user_personal_account = get_user.accounts.where(personal: true).first
	end

	random_number_of_tag_list_entries = rand(1..6) #[user_ninja3487, user_snake117, user_sgomez, user_amarino, user_tswift, user_jzuniga].sample

	if user_has_multiple_accounts && personal_or_brand == 1
		Guide.create!(
			title: Faker::Lorem.words(5..7).join(" ").titleize,
			body: Faker::Lorem.paragraphs(10..12).join(" "),
			tag_list: tag_list_options.sample(random_number_of_tag_list_entries),
			category: rand_category,
			subcategory_one: rand_one,
			subcategory_two: rand_two,
			user_id: get_user.id,
			account_id: rand_user_account.id
		)
	elsif user_has_multiple_accounts && personal_or_brand == 2
		Guide.create!(
			title: Faker::Lorem.words(5..7).join(" ").titleize,
			body: Faker::Lorem.paragraphs(10..12).join(" "),
			tag_list: tag_list_options.sample(random_number_of_tag_list_entries),
			category: rand_category,
			subcategory_one: rand_one,
			subcategory_two: rand_two,
			user_id: get_user.id,
			account_id: rand_user_account.id
		)
	else
		Guide.create!(
			title: Faker::Lorem.words(5..7).join(" ").titleize,
			body: Faker::Lorem.paragraphs(10..12).join(" "),
			tag_list: tag_list_options.sample(random_number_of_tag_list_entries),
			category: rand_category,
			subcategory_one: rand_one,
			subcategory_two: rand_two,
			user_id: get_user.id,
			account_id: user_personal_account.id
		)
	end

end


puts "There are now #{Guide.count} rows in the guides table."
Guide.reindex
puts "Reindexed: Guide"
