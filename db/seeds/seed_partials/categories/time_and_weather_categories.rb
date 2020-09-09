


time_and_weather_categories_hash = {
  weather: {
    seasons: [
      "Spring",
      "Summer",
      "Fall",
      "Winter",
      "All Year"
    ]
  },
  time: {
    day: [
      "Dawn",
      "Morning",
      "Noon",
      "Afternoon",
      "Evening",
      "Twilight",
      "Dusk",
      "Midnight"
    ]
  }
}


time_and_weather_categories_hash.each do |category_group_key, category_group_values|

  # Nested hash contains value to create CategoryGroup
  created_category_group = CategoryGroup.create!(
    name: category_group_key.to_s.titleize
  )

  puts "CategoryGroup: #{created_category_group.name} created"

  category_group_values.each do |category_key, category_values|

    created_category = Category.create!(
      name: category_key.to_s.capitalize,
      category_group_id: created_category_group.id
    )

    puts "\t#{created_category.name} created!"

    category_values.each do |subcategory|
      created_subcategory = Subcategory.create!(
        name: subcategory.to_s.capitalize,
        category_group_id: created_category_group.id,
        category_id: created_category.id
      )

      puts "\t\tSubcategory: #{created_subcategory.name} created!"
    end # category_values.each

  end # category_group_values.each

end # hobby_categories_hash.each
