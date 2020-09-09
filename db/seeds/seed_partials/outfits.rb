
### Begin: Destroy all existing Outfits in DB ###
if Outfit.count >= 1
  Outfit.destroy_all
else
  puts "No outfits exist in DB."
end
### End: Destroy all existing Outfits in DB ###

puts "------------- Begin: Create Outfits for User's Personal Account -------------"

### Begin: Create Outfits for each User's Account ###
all_users = User.all

user_personal_accounts = []

random_season = Category.find_by(name: "Seasons").subcategories
random_occasion = Category.find_by(name: "Occasions").subcategories
random_dress_code = Category.find_by(name: "Dress Code").subcategories

# Fetch each User's personal account and store it in an array
all_users.each do |user|
  user_personal_accounts << user.accounts.personal
end

user_personal_accounts.each do |user_personal_account|

  random_number_of_outfits_to_create = Random.new.rand(15..50)
  outfit_count = 0
  random_number_of_outfits_to_create.times do
    created_outfit = Outfit.create!(
      user_id: user_personal_account.first.owner_id,
      account_id: user_personal_account.first.id,
      brand_id: nil,
      name: Faker::Lorem.words(5, 7).join(" ").titleize,
      description: Faker::Lorem.paragraphs(2, 4).join(" ")
    )

    created_outfit.outfit_subcategory_items.new(outfit_id: created_outfit.id, subcategory_id: random_season.sample.id).save!
    created_outfit.outfit_subcategory_items.new(outfit_id: created_outfit.id, subcategory_id: random_occasion.sample.id).save!
    created_outfit.outfit_subcategory_items.new(outfit_id: created_outfit.id, subcategory_id: random_dress_code.sample.id).save!

    outfit_count = outfit_count + 1
    puts "\t#{outfit_count}/#{random_number_of_outfits_to_create} for #{user_personal_account.first.owner.username}"
  end # random_number_of_outfits_to_create.times

  puts "#{user_personal_account.first.owner.username} has #{outfit_count} outfits!"

end # user_personal_accounts.each do |user_personal_account|
### End: Create Outfits for each User's Account ###

puts "------------- End: Create Outfits for User's Personal Account -------------"
