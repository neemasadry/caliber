
# admin_user = User.find_by(username: "snake117", admin: true)
# admin_account = admin_user.accounts.personal

puts "--- Begin: Categorization ---\n"

body_parts_selection = {
  full: [ "Skin" ],
  head_and_neck: ["Crown", "Eyes", "Ears", "Face", "Neck"],
  "Right Arm": ["Right Arm", "Right Forearm", "Right Wrist", "Right Hand", "Right Thumb", "Right Index Finger", "Right Middle Finger", "Right Ring Finger", "Right Baby Finger"],
  body: ["Chest", "Abdomen"],
  "Left Arm": ["Left Arm", "Left Forearm", "Left Wrist", "Left Hand", "Left Thumb", "Left Index Finger", "Left Middle Finger", "Left Ring Finger", "Left Baby Finger"],
  midline: ["Waist"],
  legs: ["Upper Legs", "Lower Legs", "Full Length (Legs)"],
  feet: ["Feet"],
  other: ["Not on Body", "N/A"]
}


# Nested Level - Model
# 1 - CategoryGroup
# 2 - Category (relative terminal)
# 3 - Subcategory (absolute terminal)
# Terminal level should be an Array for simplicity, otherwise needs new conditional

puts "--- Begin: BodyPartGroup ---"

# Clean DB tables containing previous data and reset primary key count
body_part_objects = ["BodyPartGroup", "BodyPart"]

body_part_objects.each do |model|
  puts "--- Begin: #{model} DB Cleaning ---"
  constantized_model = model.constantize
  model_table_name = constantized_model.table_name

  if constantized_model.destroy_all
    puts "\t#{model} - Destroyed"
    if ActiveRecord::Base.connection.reset_pk_sequence!(model_table_name)
      puts "\t\t#{model} - Primary Key count reset"
    end # if ...reset_pk_sequence!
  end # if constantized_model.destroy_all
  puts "--- End: #{model} DB Cleaning ---"
end # body_part_objects.each

body_parts_selection.each do |body_part_group_key, body_part_group_values|

  puts "\t--- Begin: BodyPartGroup (#{body_part_group_key}) ---\n"

  create_body_part_group = BodyPartGroup.create!(
    name: body_part_group_key.to_s.titleize
  )
  puts "\t\t#{create_body_part_group.name} created!"

  ### BodyPart
  body_part_group_values.each do |value|
    create_body_part = BodyPart.create!(
      name: value,
      body_part_group_id: BodyPartGroup.find_by(name: body_part_group_key.to_s.titleize).id
    )

    puts "\t\t\t#{create_body_part.name} created!"
  end
  ###

  puts "\t--- End: BodyPartGroup (#{body_part_group_key.to_s.capitalize}) ---\n"
end

puts "--- End: BodyPartGroup ---\n"







puts "--- Begin: Category (Tree) ---\n"

# Clean DB tables containing previous data and reset primary key count
categorization_models = ["CategoryGroup", "Category", "Subcategory"]

categorization_models.each do |model|
  puts "--- Begin: #{model} DB Cleaning ---"
  constantized_model = model.constantize
  model_table_name = constantized_model.table_name

  if constantized_model.destroy_all
    puts "\t#{model} - Destroyed"
    if ActiveRecord::Base.connection.reset_pk_sequence!(model_table_name)
      puts "\t\t#{model} - Primary Key count reset"
    end # if ...reset_pk_sequence!
  end # if constantized_model.destroy_all
  puts "--- End: #{model} DB Cleaning ---"
end # categorization_models.each


# Load each partial for categories under db/seeds/seed_partials/categories/
Dir[File.join(Rails.root, 'db', 'seeds', 'seed_partials', 'categories', '*.rb')].sort.each do |filename|
  ### TEMPORARILY OMITTED - Until these categories are filled out with acceptable entries
  next if (filename == 'career_categories.rb' || filename == 'electronic_categories.rb' || filename == 'health_categories.rb' || filename == 'home_and_decor_categories.rb')
  if load filename
    puts "\t'#{filename}' loaded successfully!\n"
  else
    puts "\tAn error occured for '#{filename}'.\n"
  end
end

=begin
# Build categorization tree, nested in order: CategoryGroup -> Category -> Subcategory
category_tree.each do |category_group_key, category_group_values|
  create_category_group = CategoryGroup.create!(
    name: category_group_key.to_s.capitalize
  )
  puts "CategoryGroup: #{create_category_group.name} created!"
  puts "#{category_group_key}"

  if (category_group_key == :product)
    # Essentially, skip this level if Product as this would lead to redundant categorization
    category_group_values.each do |category_key, category_values|
      #if (category_key == :accessory || category_key == :bottom || category_key == :cosmetic || category_key == :dress || category_key == :fragrance || category_key == :jewelry || category_key == :suit || category_key == :shoe || category_key == :top)

      category_values.each do |terminal_key, terminal_values|
        create_category_for_product = Category.create!(
          name: terminal_key.to_s.capitalize,
          category_group_id: CategoryGroup.find_by(name: category_group_key.to_s.capitalize).id
        )

        puts "\tCategory: #{create_category_for_product.name} created!\n"

        terminal_values.each do |value|
          create_subcategory_for_product = Subcategory.create!(
            name: value.to_s.capitalize,
            category_group_id: CategoryGroup.find_by(name: category_group_key.to_s.capitalize).id,
            category_id: Category.find_by(name: terminal_key.to_s.capitalize).id
          )

          puts "\t\t Subcategory: #{create_subcategory_for_product.name} created!\n"
        end # terminal_values.each

      end # category_values.each
    end # category_group_values.each
  elsif category_group_key == :season || category_group_key == :brand

    # seasons_category_group = CategoryGroup.create!(
    #   name: category_group_key.to_s.capitalize
    # )

    # puts "CategoryGroup: #{seasons_category_group.name} created!\n"

    category_group_values.each do |season|
      create_season = Category.create!(
        name: season,
        category_group_id: CategoryGroup.find_by(name: category_group_key.to_s.capitalize).id
      )
      puts "\tCategory: #{create_season.name} created!"
    end

  end # if category_key == :Accessory || category_key == :Bottom || ...
end # category_tree.each
=end
puts "--- End: Category (Tree) ---\n"


puts "\n--- End: Categorization ---"
