puts "---------------- Begin: Reviews for Accessory ----------------"

products = Accessory.all

products.each do |product|
  number_of_reviews = Random.new.rand(18..68)

  number_of_reviews.times do

    rand_user_id = Random.new.rand(1..7)
    rand_quality = Random.new.rand(1..10)
    rand_value = Random.new.rand(1..10)
    rand_compliment = Random.new.rand(1..4)

    Review.create!(
        reviewable_type: product.class.name,
        reviewable_id: product.id,
        user_id: rand_user_id,
        title: Faker::Lorem.words(5..7).join(" ").titleize,
        body: Faker::Lorem.paragraphs(6..12).join(" "),
        quality: rand_quality,
        value: rand_value,
        compliment: rand_compliment
      )
  end # number_of_reviews

end # accessories.each

puts "---------------- End: Reviews for Accessory ----------------\n"
