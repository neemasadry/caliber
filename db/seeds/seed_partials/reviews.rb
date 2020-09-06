puts "---------------- Begin: Destroy all Review for Accessory ----------------\n"

product_model_types = ["Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Suit", "Top"]

product_model_types.each do |model_str|
  model_obj = model_str.constantize

  model_obj.all.each do |instance|
    instance.reviews.destroy_all
    puts "Destroyed all reviews for #{instance.name}.\n"
  end
end

puts "---------------- End: Destroy all Review for Accessory ----------------\n"




puts "---------------- Begin: Reviews ----------------\n"

users = User.all

users.each do |user|

  product_counter = 1

  product_model_types.each do |model_str|

    model_obj = model_str.constantize

    model_obj.all.each do |product_instance|

      brand_owners = product_instance.brand.account.account_users
      account_owner = product_instance.brand.account.owner_id

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
            reviewable_type: product_instance.class.name,
            reviewable_id: product_instance.id,
            #product_id: product_instance.find_by(name: ), ADD :product_id references!
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
        end
      end # check if user is an owner
    end # brand_owners.each
  end # accessories.each

  puts "#{user.id} - #{user.username} wrote a review.\n"

end # users.each

puts "---------------- End: Reviews ----------------\n"
