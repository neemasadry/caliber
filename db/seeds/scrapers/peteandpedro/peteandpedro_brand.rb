AVATAR_PATH = "db/seeds/scrapers/peteandpedro/files/avatars/"
LOGO_PATH = "db/seeds/scrapers/peteandpedro/files/logos/"

user_data_hash = {
  user_info: {
    email: "amarino@alpham.com",
    password: "password",
    first_name: "Aaron",
    last_name: "Marino",
    username: "alpham",
    gender: "Male",
    country_code: "US",
    time_zone: "Eastern Time (US & Canada)",
    date_of_birth: "1977-12-23",
    admin: false,
    moderator: false,
    terms_of_service: true
  },
  avatar_info: {
    io: File.open(Rails.root.join(AVATAR_PATH, "avatar_man_brownHair_m2.png")),
    filename: "avatar_man_brownHair_m2.png",
    content_type: "image/png"
  }
}

# Create and find users
create_user = User.create!(user_data_hash[:user_info])
find_user = User.find_by(username: create_user.username)
# create_scraper_user = ScraperUser.create(user_data_hash[:user_info])
# find_scraper_user = ScraperUser.find_by(username: create_scraper_user.username)

# Create and find accounts
create_account = create_user.accounts.build(name: "Pete & Pedro", owner_id: find_user.id, personal: false).save
find_account = Account.find_by(owner_id: find_user.id)
# create_scraper_account = create_scraper_user.accounts.build(name: "Pete & Pedro", owner_id: find_user.id, personal: false).save
# find_scraper_account = ScraperAccount.find_by(owner_id: find_scraper_user.id)



if find_user.avatar.blank?
  create_user.avatar.attach(user_data_hash[:avatar_info])
  puts "Avatar attached successfully for #{user_data_hash[:user_info][:username]}!"
else
  puts "Avatar already attached for #{user_data_hash[:user_info][:username]}."
end

if find_user.present?

  if find_account.present?

    brand_data_hash = {
      brand_info: {
        user_id: find_user.id,
        account_id: find_account.id,
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
      },
      logo_info: {
        io: File.open(Rails.root.join(LOGO_PATH, "Pete_Pedro-with_donkey-horizontal.png")),
        filename: "Pete_Pedro-with_donkey-horizontal.png",
        content_type: "image/png"
      },
      scraper_logo_info: {
        io: File.open(Rails.root.join(LOGO_PATH, "Pete_Pedro-with_donkey-horizontal.png")),
        filename: "Pete_Pedro-with_donkey-horizontal.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Grooming/Hygiene").id
      }
    }

    # Create Brand
    create_brand = Brand.create(brand_data_hash[:brand_info])

    scraper_brand_data_hash = brand_data_hash
    scraper_brand_data_hash[:brand_info][:user_id] = "alpham"
    scraper_brand_data_hash[:brand_info][:account_id] = "Pete & Pedro"

    create_scraper_brand = ScraperBrand.create!(scraper_brand_data_hash[:brand_info])

    # Find Brand
    find_brand = Brand.find_by(brand_identifier: create_brand.brand_identifier)
    find_scraper_brand = ScraperBrand.find_by(brand_identifier: create_brand.brand_identifier)

    if find_brand.present? && find_brand.brand_category_items.build(brand_data_hash[:categorization_info]).save

      puts "Brand: #{brand_data_hash[:brand_info][:name]} created!"

      if find_brand.logo.blank?
        create_brand.logo.attach(brand_data_hash[:logo_info])
        create_scraper_brand.logo.attach(brand_data_hash[:scraper_logo_info])
        puts "\tLogo successfully attached! [#{brand_data_hash[:logo_info][:filename]} -> #{brand_data_hash[:brand_info][:brand_identifier]}]\n"
      else
        puts "\tLogo already attached."
      end # create_brand.logo.attach

    end # create_brand.save! && ...

  else
    puts "Error: Account was not created or present in DB!\n"
  end # create_account.save!

else
  puts "Error: User not created or present in DB!\n"
end # create_user.save!
