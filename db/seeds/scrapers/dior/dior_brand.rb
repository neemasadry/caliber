require_relative 'shared/dior_vars.rb'

user_data_hash = {
  user_info: {
    email: "mariachiuri@dior.com",
    password: "password",
    first_name: "Maria",
    last_name: "Chiuri",
    username: "mariachiuri",
    gender: "Female",
    country_code: "FR",
    time_zone: "Paris",
    date_of_birth: "1964-06-03",
    admin: false,
    moderator: false,
    terms_of_service: true
  },
  avatar_info: {
    io: File.open(Rails.root.join(AVATAR_PATH, "female-brunette-sharp-eyes.jpg")),
    filename: "female-brunette-sharp-eyes.jpg",
    content_type: "image/jpg"
  }
}


create_user = User.create(user_data_hash[:user_info])
find_user = User.find_by(username: create_user.username)

create_account = create_user.accounts.build(name: "Dior", owner_id: find_user.id, personal: false).save
find_account = Account.find_by(owner_id: find_user.id)

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
        user_id: User.find_by(username: "mariachiuri").id,
        account_id: Account.find_by(name: "Dior").id,
        name: "Dior",
        brand_identifier: "dior",
        founding_date: "1946-12-16",
        about: Faker::Lorem.paragraphs(4..7).join(" "),
        price_range: 4,
        homepage_link: "https://www.dior.com/en_us",
        email: "customersupport@dior.com",
        story: "Christian Dior was a visionary. Beginning with his first collection in 1947 he rewrote the rules of modern elegance and imposed his style on the entire world. He brought women his vision of beauty and happiness. He showed unprecedented creative originality.From the renowned Bar suit to the grandest evening gowns, the famous Lady Dior bag to the Dior VIII watch and Bois de Rose jewellery, the Dior Addict lipstick and the best selling J’adore perfume, DIOR’s creations constitute an unmatched universe.\nChristian Dior’s vision has always been ahead of its time, fascinating women with his ability to combine utmost modernity with timeless elegance.",
        mission: "True Luxury requires genuine materials and the craftman’s sincerity. It is only meaningful when it respects tradition",
        phone: "",
        address1: "30 Avenue Montaigne",
        address2: "",
        city: "Paris",
        state_code: "NA",
        country_code: "FR",
        zipcode: "75008",
        instagram_link: "https://www.instagram.com/dior/",
        youtube_link: "https://www.youtube.com/user/Dior",
        facebook_link: "https://www.facebook.com/Dior/",
        twitter_link: "https://twitter.com/DIOR/",
        snapchat_link: "https://www.snapchat.com/add/dior",
        tiktok_link: "https://www.tiktok.com/@dior"
      },
      logo_info: {
        io: File.open(Rails.root.join(LOGO_PATH, "Dior_Logo.png")),
        filename: "Dior_Logo.png",
        content_type: "image/png"
      },
      scraper_logo_info: {
        io: File.open(Rails.root.join(LOGO_PATH, "Dior_Logo.png")),
        filename: "Dior_Logo.png",
        content_type: "image/png"
      },
      categorization_info: {
        category_id: Category.find_by(name: "Luxury Goods").id
      }
    }

    create_brand = Brand.create(brand_data_hash[:brand_info])

    scraper_brand_data_hash = brand_data_hash
    scraper_brand_data_hash[:brand_info][:user_id] = "mariachiuri"
    scraper_brand_data_hash[:brand_info][:account_id] = "Dior"

    create_scraper_brand = ScraperBrand.create(scraper_brand_data_hash[:brand_info])

    # Find Brand
    find_brand = Brand.find_by(brand_identifier: create_brand.brand_identifier)
    find_scraper_brand = ScraperBrand.find_by(brand_identifier: create_brand.brand_identifier)

    if find_brand.present? && find_brand.brand_category_items.build(brand_data_hash[:categorization_info]).save

      puts "Brand: #{brand_data_hash[:brand_info][:name]} created!"

      if find_brand.logo.blank?
        create_brand.logo.attach(brand_data_hash[:logo_info]) # unless find_brand.logo.attached?
        puts "\tLogo successfully attached! [#{brand_data_hash[:logo_info][:filename]} -> #{brand_data_hash[:brand_info][:brand_identifier]}]\n"
      else
        puts "\tLogo already attached."
      end # create_brand.logo.attach

    end # create_brand.save! && ...

  else
    puts "Error: Account not created or present in DB!\n"
  end # create_account.save!

else
  puts "Error: User not created or present in DB!\n"
end # create_user.save!
