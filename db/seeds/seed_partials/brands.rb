
### Create Accounts first ###
# Merged from previous seed partial: db/seeds/seed_partials/accounts.rb
# Required to be associated with User first, then Brands can be associated to User *through* their respective Account

acosta = User.find_by(email: "alex@costa.com")
amarino = User.find_by(email: "amarino@alpham.com")
jzuniga = User.find_by(email: "jzuniga@gmail.com")
kjenner = User.find_by(email: "kylie@jenner.com")

users_with_brands = [acosta, amarino, jzuniga, kjenner]

puts "---------------- Begin: Account ----------------"

### Alex Costa
Account.new(
    name: "Forte",
    owner: acosta,
    personal: false
  ).account_users.new(user: acosta, admin: true).save!
puts "Forte created!"


### Aaron Marino
Account.new(
    name: "Pete & Pedro",
    owner: amarino,
    personal: false
  ).account_users.new(user: amarino, admin: true).save!
puts "Pete & Pedro created!"

Account.new(
    name: "Tiege Hanley",
    owner: amarino,
    personal: false
  ).account_users.new(user: amarino, admin: true).save!
puts "Tiege Hanley created!"

Account.new(
    name: "Enemy",
    owner: amarino,
    personal: false
  ).account_users.new(user: amarino, admin: true).save!
puts "Enemy created!"


### Jose Zuniga
Account.new(
    name: "Jade Black",
    owner: jzuniga,
    personal: false
  ).account_users.new(user: jzuniga, admin: true).save!
puts "Jade Black created!"

Account.new(
    name: "ESNTLS",
    owner: jzuniga,
    personal: false
  ).account_users.new(user: jzuniga, admin: true).save!
puts "ESNTLS created!"


### Kylie Jenner
Account.new(
    name: "Kylie Skin",
    owner: kjenner,
    personal: false
  ).account_users.new(user: kjenner, admin: true).save!
puts "Kylie Skin created!"


puts "---------------- End: Account ----------------"




# Clear all previous seeded Brands to avoid duplication errors
Brand.destroy_all

logo_path = "db/seeds/brand_images/logos/"

puts "---------------- Begin: Brand ----------------"

forte_logo = "forte-series.png"
forte_logo_file_path = File.open(Rails.root.join(logo_path, forte_logo))
forte_blob = {io: forte_logo_file_path, filename: forte_logo, content_type: "image/png"}
# uploaded_forte_logo = logo_uploader.upload(forte_logo_file_path)

### Alex Costa
acosta_forte = "Forte"
acosta_forte_mission = Faker::Lorem.words(5..7).join(" ")
b_forte = Brand.create!(
  user_id: 3,
  account_id: Account.find_by(name: acosta_forte).id,
  name: acosta_forte,
  brand_identifier: "forte",
  category: "Grooming & Hygiene",
  founding_date: "2020-02-24",
  about: Faker::Lorem.paragraphs(4..7).join(" "),
  price_range: 2,
  homepage_link: "https://forteseries.com/",
  email: "customercare@forteseries.com",
  story: Faker::Lorem.paragraphs(4..7).join(" "),
  mission: acosta_forte_mission,
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
  tiktok_link: "https://www.tiktok.com/@alexcosta"
)

b_forte.logo.attach(forte_blob)

puts "Forte created!"



### Aaron Marino
pete_and_pedro_logo = "Pete_Pedro-with_donkey-horizontal.png"
pete_and_pedro_logo_file_path = File.open(Rails.root.join(logo_path, pete_and_pedro_logo))
pete_and_pedro_blob = {io: pete_and_pedro_logo_file_path, filename: pete_and_pedro_logo, content_type: "image/png"}
# uploaded_pete_and_pedro_logo = logo_uploader.upload(pete_and_pedro_logo_file_path)

amarino_pnp = "Pete & Pedro"
b_peteandpedro = Brand.create!(
  user_id: 5,
  account_id: Account.find_by(name: amarino_pnp).id,
  name: amarino_pnp,
  brand_identifier: "peteandpedro",
  category: "Grooming & Hygiene",
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
  tiktok_link: ""
)

b_peteandpedro.logo.attach(pete_and_pedro_blob)

puts "Pete & Pedro created!"



tiege_hanley_logo = "tiege_hanley_logo_square.png"
tiege_hanley_logo_file_path = File.open(Rails.root.join(logo_path, tiege_hanley_logo))
tiege_hanley_blob = {io: tiege_hanley_logo_file_path, filename: tiege_hanley_logo, content_type: "image/png"}
# uploaded_tiege_hanley_logo = logo_uploader.upload(tiege_hanley_logo_file_path)

amarino_th = "Tiege Hanley"
b_tiege = Brand.create!(
    user_id: 5,
    account_id: Account.find_by(name: amarino_th).id,
    name: amarino_th,
    brand_identifier: "tiegehanley",
    category: "Grooming & Hygiene",
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
    tiktok_link: ""
  )

b_tiege.logo.attach(tiege_hanley_blob)

puts "Tiege Hanley created!"


# ### Jose Zuniga
esntls_logo = "esntls_logo_bg_white.png"
esntls_logo_file_path = File.open(Rails.root.join(logo_path, esntls_logo))
esntls_blob = {io: esntls_logo_file_path, filename: esntls_logo, content_type: "image/png"}
# uploaded_esntls_logo = logo_uploader.upload(esntls_logo_file_path)

jzuniga_esntls = "ESNTLS"
b_esntls = Brand.create!(
    user_id: 7,
    account_id: Account.find_by(name: jzuniga_esntls).id,
    name: jzuniga_esntls,
    brand_identifier: "esntls",
    category: "Clothing & Accessories",
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
    tiktok_link: ""
  )

b_esntls.logo.attach(esntls_blob)

puts "ESNTLS created!"



jade_black_logo = "jade_black.png"
jade_black_logo_file_path = File.open(Rails.root.join(logo_path, jade_black_logo))
jade_black_blob = {io: jade_black_logo_file_path, filename: jade_black_logo, content_type: "image/png"}

jzuniga_jb = "Jade Black"
b_jade_black = Brand.create!(
    user_id: 7,
    account_id: Account.find_by(name: jzuniga_jb).id,
    name: jzuniga_jb,
    brand_identifier: "jadeblack",
    category: "Clothing & Accessories",
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
    tiktok_link: ""
  )

b_jade_black.logo.attach(jade_black_blob)

puts "Jade Black created!"



# ### Kylie Jenner
kylie_skin_logo = "kylie-skin-logo.jpg"
kylie_skin_logo_file_path = File.open(Rails.root.join(logo_path, kylie_skin_logo))
kylie_skin_blob = {io: kylie_skin_logo_file_path, filename: kylie_skin_logo, content_type: "image/jpg"}
# uploaded_kylie_skin_logo = logo_uploader.upload(kylie_skin_logo_file_path)

kjenner_ks = "Kylie Skin"
b_kylieskin = Brand.create!(
    user_id: 8,
    account_id: Account.find_by(name: kjenner_ks).id,
    name: kjenner_ks,
    brand_identifier: "kylieskin",
    category: "Beauty & Hygiene",
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
    tiktok_link: ""
  )

b_kylieskin.logo.attach(kylie_skin_blob)

puts "Kylie Skin created!"


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
