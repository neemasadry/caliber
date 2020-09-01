
### Create Accounts first ###
# Merged from previous seed partial: db/seeds/seed_partials/accounts.rb
# Required to be associated with User first, then Brands can be associated to User *through* their respective Account

acosta = User.find_by(email: "alex@costa.com")
amarino = User.find_by(email: "amarino@alpham.com")
jzuniga = User.find_by(email: "jzuniga@gmail.com")
kjenner = User.find_by(email: "kylie@jenner.com")

# users_with_brands = [acosta, amarino, jzuniga, kjenner]
user_account_brand = {
  "Forte": acosta,
  "Pete & Pedro": amarino,
  "Tiege Hanley": amarino,
  "Enemy": amarino,
  "Jade Black": jzuniga,
  "ESNTLS": jzuniga,
  "Kylie Skin": kjenner
}

puts "---------------- Begin: Account ----------------"

user_account_brand.each do |account_key, account_value|
  Account.new(
      name: account_key,
      owner: account_value,
      personal: false
    ).account_users.new(user: account_value, admin: true).save!
  puts "\t#{account_key} created!"
end

puts "---------------- End: Account ----------------"




# Clear all previous seeded Brands to avoid duplication errors
Brand.destroy_all

logo_path = "db/seeds/brand_images/logos/"

puts "---------------- Begin: Brand ----------------"


hash_of_brand_data = {
  "Alex Costa": {
    "Forte": {
      brand_info: {
        user_id: User.find_by(username: "AlexCosta").id,
        account_id: Account.find_by(name: "Forte").id,
        name: "Forte",
        brand_identifier: "forte",
        # category_id: Category.find_by(name: "Grooming/Hygiene").id,
        founding_date: "2020-02-24",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 2,
        homepage_link: "https://forteseries.com/",
        email: "customercare@forteseries.com",
        story: Faker::Lorem.paragraphs(4..7).join(" "),
        mission: Faker::Lorem.words(5..7).join(" "),
        phone: "12345677890",
        address1: "1234 Somewhere Dr",
        address2: "Building 8",
        city: "Los Angeles",
        state_code: "CA",
        country_code: "USA",
        zipcode: "90033",
        instagram_link: "https://www.instagram.com/forteseries/",
        youtube_link: "https://www.youtube.com/c/AlexCosta/",
        facebook_link: "https://www.facebook.com/forteseries/",
        twitter_link: "https://twitter.com/forteseries/",
        snapchat_link: "https://www.snapchat.com/add/xmadeinbrazil",
        tiktok_link: "https://www.tiktok.com/@alexcosta",
        # parent: Account.find_by(name: "Forte")
      },
      logo_info: {
        io: File.open(Rails.root.join(logo_path, "forte-series.png")),
        filename: "forte-series.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Grooming/Hygiene").id
      }
    } # Forte
  }, # Alex Costa
  "Aaron Marino": {
    "Pete & Pedro": {
      brand_info: {
        user_id: User.find_by(username: "alpham").id,
        account_id: Account.find_by(name: "Pete & Pedro").id,
        name: "Pete & Pedro",
        brand_identifier: "peteandpedro",
        # category_id: Category.find_by(name: "Grooming/Hygiene").id,
        founding_date: "2013-04-01",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 2,
        homepage_link: "https://peteandpedro.com/",
        email: "customercare@peteandpedro.com",
        story: "The most unlikely pair in the quest for Bueno Hair! is the brainchild of YouTube sensation Aaron Marino, aka Alpha M. After years of building an audience with his down-to-earth, humorous, bold, and authentic videos on a whole slew of men’s topics from grooming to lifestyle to fitness, Aaron’s entrepreneurial eagerness consumed him.\nNot happy with the styling aids he was using for his dynamic hair, Aaron sought the sage advice of his world-renowned stylist Stephen Posta about starting a hair care line. After almost a year of development, grooming gold was struck and P&P was launched!\nAaron always wanted to build a brand that was quirky and authentic. Be brave. Be different. Might as well start with the brand name and logo. The secret to the brand name is that Pete & Pedro represents Aaron’s love for his parents. Aaron’s dad’s name is Pete. His mom's name, no, is not Pedro.\nGrowing up Aaron’s mom had a mini donkey farm so he spent a lot of time around the lovable creature. He's always had a soft spot for the uber friendly, highly intelligent (despite the jokes), and hard-working animal. And, his mom's favorite donkey was named Pedro. Needing something to represent his mom that was catchy to match-up with Pete, his pal Pedro instantly popped up in his mind.\nPete meet Pedro. Pedro meet Pete. And just like that Pete & Pedro was born and Bueno Hair! has been happening ever since. ",
        mission: "Salon quality products with a fun and quirky personality.",
        phone: "14049180020",
        address1: "869 Pickens Ind Dr.",
        address2: "Ste 2",
        city: "Merietta",
        state_code: "GA",
        country_code: "USA",
        zipcode: "30062-3164",
        instagram_link: "https://www.instagram.com/peteandpedro/",
        youtube_link: "https://www.youtube.com/user/AlphaMconsulting",
        facebook_link: "https://www.facebook.com/peteandpedro/",
        twitter_link: "https://twitter.com/pnpbuenohair/",
        snapchat_link: "",
        tiktok_link: "",
        # parent: Account.find_by(name: "Pete & Pedro")
      },
      logo_info: {
        io: File.open(Rails.root.join(logo_path, "Pete_Pedro-with_donkey-horizontal.png")),
        filename: "Pete_Pedro-with_donkey-horizontal.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Grooming/Hygiene").id
      }
    }, # Pete & Pedro
    "Tiege Hanley": {
      brand_info: {
        user_id: User.find_by(username: "alpham").id,
        account_id: Account.find_by(name: "Tiege Hanley").id,
        name: "Tiege Hanley",
        brand_identifier: "tiegehanley",
        # category_id: Category.find_by(name: "Grooming/Hygiene").id,
        founding_date: "2016-05-21",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 2,
        homepage_link: "https://www.tiege.com/",
        email: "customercare@tiege.com",
        story: "The Tiege Story\n\nThe Tiege Hanley story is simple and uncomplicated, just like our products. Founded by four \“regular guys,\” we created a product system and brand that makes skin care meaningful, accessible, affordable and clinically relevant—for regular guys.\nThe brain child of Kelley Thornton, Tiege Hanley, named after one of Kelley’s prominent ancestors, was inspired by a department store skin care aisle stroll. As Kelley perused, he was struck by three simple truths:\n1. Guys really don’t know much about skin care\n2. Men’s skin care products are complicated and confusing\n3. Man, are those products expensive!\nDrawing on his marketing and brand management experience, Kelley got to work, enlisting his college roommate turned software industry guru, Rob Hoxie, to help mastermind a skin care solution for men that hits all three points—it has to be sensible, simple and affordable.\nKelley and Rob wanted to help regular guys look and feel amazing by creating a skin care system that was easy to understand and to use. But what good is an idea without an audience? Enter Aaron Marino—men's lifestyle expert, grooming guru, YouTube sensation and serial entrepreneur. Aaron’s male-centric passion for health and lifestyle, personal brand and cult-like following made him Tiege Hanley’s ideal partner number three.\nNow that the team had a powerful way to reach men, they were only missing the final ingredient—the products themselves. Daunting undertaking? Nah! They did what any regular guys would do—took their idea to the golf course, where they teed up with the man who would become Tiege Hanley’s master skin care formulator. Known only as The Chemist (who prefers to remain incognito) and with more than 35 years of experience formulating products for some of the top skin care brands, he agreed to join the team as fourth partner and is the creator of what the team calls their \“Ferrari formulas.\”",
        mission: "Uncomplicated Skin Care for Men",
        phone: "3122792780",
        address1: "2023 W. Carroll Ave",
        address2: "",
        city: "Chicago",
        state_code: "IL",
        country_code: "USA",
        zipcode: "60612",
        instagram_link: "https://www.instagram.com/tiegehanley/",
        youtube_link: "https://www.youtube.com/c/TiegeHanley",
        facebook_link: "https://www.facebook.com/tiegehanley/",
        twitter_link: "https://twitter.com/tiegehanley/",
        snapchat_link: "",
        tiktok_link: "",
        # parent: Account.find_by(name: "Tiege Hanley")
      },
      logo_info: {
        io: File.open(Rails.root.join(logo_path, "tiege_hanley_logo_square.png")),
        filename: "tiege_hanley_logo_square.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Grooming/Hygiene").id
      }
    } # Tiege Hanley
    # "Enemy": {

    # }
  }, # Aaron Marino
  "Jose Zuniga": {
    "ESNTLS": {
      brand_info: {
        user_id: User.find_by(username: "josezuniga").id,
        account_id: Account.find_by(name: "ESNTLS").id,
        name: "ESNTLS",
        brand_identifier: "esntls",
        # category_id: Category.find_by(name: "Clothing").id,
        founding_date: "2017-05-21",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 2,
        homepage_link: "https://www.esntls.co/",
        email: "info@esntls.com",
        story: "2017-After being frustrated with the what's on the market, we set out to create the perfect basic tee.\n2018 - After releasing the basic tee and seeing the amazing response, we decided to take our talents to a lot of the other essentials everyone needs. We created the perfect V-Necks, Long Sleeve tees, Hoodies, Track Pants, Underwear and Socks.\n2019 - After solidifying the base essentials, we started working towards developing items that offer the look of formal wear but the versatility and the comfort of an ESNTL. The ESNTL Cargo showcases our effort to push the boundaries and bridge the gap between comfort and formal wear.",
        mission: "Uncomplicated Skin Care for Men",
        phone: "3122792780",
        address1: "1111 Somewhere Ave",
        address2: "Warehouse 2",
        city: "Los Angeles",
        state_code: "CA",
        country_code: "USA",
        zipcode: "60612",
        instagram_link: "https://www.instagram.com/_esntls/",
        youtube_link: "",
        facebook_link: "https://www.facebook.com/ESNTLS/",
        twitter_link: "https://twitter.com/tiegehanley/",
        snapchat_link: "",
        tiktok_link: "",
        # parent: Account.find_by(name: "ESNTLS")
      },
      logo_info: {
        io: File.open(Rails.root.join(logo_path, "esntls_logo_bg_white.png")),
        filename: "esntls_logo_bg_white.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Clothing").id
      }
    },
    "Jade Black": {
      brand_info: {
        user_id: User.find_by(username: "josezuniga").id,
        account_id: Account.find_by(name: "Jade Black").id,
        name: "Jade Black",
        brand_identifier: "jadeblack",
        # category_id: Category.find_by(name: "Clothing").id,
        founding_date: "2017-05-21",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 2,
        homepage_link: "https://www.jadeblack.co/",
        email: "info@jadeblack.co",
        story: Faker::Lorem.paragraphs(4..7).join(" "),
        mission: "To make it possible for anyone to have a quality eyewear wardrobe.",
        phone: "3122792780",
        address1: "1111 Somewhere Ave",
        address2: "Warehouse 2",
        city: "Los Angeles",
        state_code: "CA",
        country_code: "USA",
        zipcode: "60612",
        instagram_link: "https://www.instagram.com/jadeblack.co/",
        youtube_link: "",
        facebook_link: "",
        twitter_link: "",
        snapchat_link: "",
        tiktok_link: "",
        # parent: Account.find_by(name: "Jade Black")
      },
      logo_info: {
        io: File.open(Rails.root.join(logo_path, "jade_black.png")),
        filename: "jade_black.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Clothing").id
      }
    } # Jade Black
  }, # Jose Zuniga
  "Kylie Jenner": {
    "Kylie Skin": {
      brand_info: {
        user_id: User.find_by(username: "kyliejenner").id,
        account_id: Account.find_by(name: "Kylie Skin").id,
        name: "Kylie Skin",
        brand_identifier: "kylieskin",
        # category_id: Category.find_by(name: "Beauty/Cosmetics").id,
        founding_date: "2014-05-21",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 2,
        homepage_link: "https://kylieskin.com/",
        email: "customerservice@kylieskin.com",
        story: "Skincare and makeup go hand in hand and Kylie Skin was something I dreamt up soon after Kylie Cosmetics. I’ve been working on this for what feels like a lifetime so I can’t believe it’s finally here! Building my makeup line from the ground up has taught me a lot and I’m so blessed with that knowledge to apply to my brand new company! Birthing a whole new team, manufacturing, fulfillment etc. separate from my cosmetics line was challenging but here we are! I got the best of the best for you guys! Everything is cruelty free, vegan, gluten free, paraben and sulfate free and suitable for all skin types. Make sure you follow @kylieskin to stay updated. So much love went into this. It all starts with skin. xo, Kylie",
        mission: "To give beautiful skin to all women.",
        phone: "3122792780",
        address1: "2222 W. Somewhere Dr",
        address2: "",
        city: "Oxnard",
        state_code: "CA",
        country_code: "USA",
        zipcode: "60612",
        instagram_link: "https://www.instagram.com/kylieskin/",
        youtube_link: "",
        facebook_link: "https://www.facebook.com/kylieskin/",
        twitter_link: "https://twitter.com/kylieskin/",
        snapchat_link: "",
        tiktok_link: "",
        # parent: Account.find_by(name: "Kylie Skin")
      },
      logo_info: {
        io: File.open(Rails.root.join(logo_path, "kylie-skin-logo.jpg")),
        filename: "kylie-skin-logo.jpg",
        content_type: "image/jpg"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Beauty/Cosmetics/Hygiene").id
      }
    } # Kylie Skin
  } # Kylie Jenner
}


hash_of_brand_data.each do |owner_key, owner_values|
  owner_values.each do |brand_key, brand_values|

    create_brand = Brand.new(brand_values[:brand_info])
    # brand_with_categorization = Brand.find_by(brand_identifier: brand_values[:brand_info][:brand_identifier]).brand_category_items.build(brand_values[:categorization_info])

    if create_brand.save! && Brand.find_by(brand_identifier: brand_values[:brand_info][:brand_identifier]).brand_category_items.build(brand_values[:categorization_info]).save!
      puts "\t#{brand_key} (#{owner_key}) and category association created!"

      if create_brand.logo.attach(brand_values[:logo_info])
        puts "\t\t#{brand_values[:logo_info][:filename]} attached to #{brand_key}!"
      end

    end # create_brand.save!

  end # owner_values.each
end # hash_of_brand_data.each


puts "---------------- End: Brand ----------------"


# Brand.create!(
#   user_id: ,
#   account_id: ,
#   name: ,
#   category: ,
#   founding_date: ,
#   about: ,
#   price_range: ,
#   homepage_link: ,
#   email: ,
#   story: ,
#   mission: ,
#   phone: ,
#   address1: ,
#   address2: ,
#   city: ,
#   state_code: ,
#   country_code: ,
#   zipcode: ,
#   instagram_link: ,
#   youtube_link: ,
#   facebook_link: ,
#   twitter_link: ,
#   snapchat_link:
# )
