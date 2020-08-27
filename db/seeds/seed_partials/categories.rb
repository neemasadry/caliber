
admin_user = User.find_by(username: "snake117", admin: true)
admin_account = admin_user.accounts.personal

puts "--- Begin: CategoryGroup ---\n"

# Nested Level - Model
# 1 - CategoryGroup
# 2 - Category
# 3 - Subcategory

category_groups = {
  "Body Parts":
            {
              Head: ["Crown", "Eyes", "Ears"],
              Neck: ["Neck"],
              "Right Arm": ["Right Arm", "Right Forearm", "Right Wrist", "Right Hand", "Right Thumb", "Right Index Finger", "Right Middle Finger", "Right Ring Finger", "Right Baby Finger"],
              Chest: ["Under", "First Layer", "Second Layer", "Third Layer", "Fourth Layer"],
              "Left Arm": ["Left Arm", "Left Forearm", "Left Wrist", "Left Hand", "Left Thumb", "Left Index Finger", "Left Middle Finger", "Left Ring Finger", "Left Baby Finger"],
              Waist: ["Belt", "Accessory"],
              Legs: ["Under", "Short", "Full"],
              Feet: ["Under", "Feet"]
            },
  Products:
            {
              Accessory: ,
              Bottom: ,
              Cosmetic: ,
              Dress: ,
              Fragrance: ,
              Jewelry: ,
              Shoe: ,
              Suit: ,
              Top:
            },
  Seasons:
            {

            },
  Occasions:
            {

            },
  Events:
            {

            },
  Relationships:
            {

            },
  Electronics:
            {

            },
  Software:
            {

            },
  Career:
            {

            },
  Hobbies:
            {

            },
  Cooking:
            {

            },
  Fitness:
            {

            },
  Class:
            {

            },
  Cleanliness:
            {

            },
  Nutrition:
            {

            },
  Furniture:
            {

            },
  Organization:
            {

            }
}

category_groups.each do |category_group|
  create_group = CategoryGroup.create!(
    user_id: admin_user,
    account_id: admin_account,
    name: category_group
  )
  puts "#{create_group.name} created!"
end

puts "--- End: CategoryGroup ---\n"





puts "--- Begin: Category ---\n"
categories = [

].sort

category_groups.each do |category_group|
  categories.each do |category|
    create_category = Category.create!(
      user_id: admin_user,
      account_id: admin_account,
      name: category_group
    )
    puts "\t#{create_category.name} created!"
  end
end

puts "--- End: Category ---\n"
