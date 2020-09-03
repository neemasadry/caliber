
puts "---------------- Begin: Destroy all Review for Accessory ----------------\n"

all_accessories = Accessory.all

all_accessories.each do |accessory|
  accessory.reviews.destroy_all
  puts "Destroyed all reviews for #{accessory.name}.\n"
end

puts "---------------- End: Destroy all Review for Accessory ----------------\n"




puts "---------------- Begin: Reviews for Accessory ----------------\n"

users = User.all
products = Accessory.all

users.each do |user|

  product_counter = 1

  products.each do |product|

    brand_owners = product.brand.account.account_users
    account_owner = product.brand.account.owner_id

    brand_owners.each do |brand_owner|
      if user.id == brand_owner.user_id || user.id == account_owner

        puts "Skipped - #{user.username} is an owner of this product!\n"
        next

      else

        rand_quality = Random.new.rand(1..10)
        rand_value = Random.new.rand(1..10)
        rand_compliment = Random.new.rand(1..4)

        # Ratings
        design_rand     = Random.new.rand(1..10)
        comfort_rand    = Random.new.rand(1..10)
        durability_rand = Random.new.rand(1..10)
        uniqueness_rand = Random.new.rand(1..10)

        Review.create!(
          reviewable_type: product.class.name,
          reviewable_id: product.id,
          user_id: user.id,
          title: Faker::Lorem.words(5..7).join(" ").titleize,
          body: Faker::Lorem.paragraphs(6..12).join(" "),
          quality: rand_quality,
          value: rand_value,
          compliment: rand_compliment,
          ratings: {
            accessory_design: design_rand,
            accessory_comfort: comfort_rand,
            accessory_durability: durability_rand,
            accessory_uniqueness: uniqueness_rand
          }
        )
        puts "#{product_counter} - #{user.username} wrote a review.\n"
        product_counter += 1
      end # check if user is an owner
    end # brand_owners.each
  end # accessories.each

  puts "#{user.id} - #{user.username} wrote a review.\n"

end # users.each

puts "---------------- End: Reviews for Accessory ----------------\n"


# puts "---------------- Begin: Reviews for Accessory ----------------\n"

# products = Accessory.all

# products.each do |product|
#   number_of_reviews = Random.new.rand(18..68)

#   number_of_reviews.times do

#     rand_user_id = Random.new.rand(1..7)
#     rand_quality = Random.new.rand(1..10)
#     rand_value = Random.new.rand(1..10)
#     rand_compliment = Random.new.rand(1..4)

#     # Ratings
#     design_rand     = Random.new.rand(1..10)
#     comfort_rand    = Random.new.rand(1..10)
#     durability_rand = Random.new.rand(1..10)
#     uniqueness_rand = Random.new.rand(1..10)

#     Review.create!(
#       reviewable_type: product.class.name,
#       reviewable_id: product.id,
#       user_id: rand_user_id,
#       title: Faker::Lorem.words(5..7).join(" ").titleize,
#       body: Faker::Lorem.paragraphs(6..12).join(" "),
#       quality: rand_quality,
#       value: rand_value,
#       compliment: rand_compliment,
#       ratings: {
#         accessory_design: design_rand,
#         accessory_comfort: comfort_rand,
#         accessory_durability: durability_rand,
#         accessory_uniqueness: uniqueness_rand
#       }
#     )
#   end # number_of_reviews

#   puts "#{number_of_reviews} reviews have been created for #{product.name}.\n"

# end # accessories.each

# puts "---------------- End: Reviews for Accessory ----------------\n"
