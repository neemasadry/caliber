LOGO_PATH = "db/seeds/brand_images/logos/"

user_hash = {
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
}



data_hash = {
  brand_info: {
    # user_id: User.find_by(username: "...").id,
    # account_id: Account.find_by(name: "Dior").id,
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
    tiktok_link: "https://www.tiktok.com/@dior",
  },
  logo_info: {
    io: File.open(Rails.root.join(LOGO_PATH, "Dior_Logo.png")),
    filename: "Dior_Logo.png",
    content_type: "image/png"
  },
  categorization_info: {
    category_id: Category.find_by(name: "Luxury Goods").id
  }
}

create_user = User.new(user_hash)

if create_user.save!
  data_hash[:brand_info][:user_id] = create_user.id
  create_account = Account.new(name: "Dior", owner_id: data_hash[:brand_info][:user_id], personal: false)

  if create_account.save!
    data_hash[:brand_info][:account_id] = create_account.id
    create_brand = Brand.new(data_hash[:brand_info])

    if create_brand.save! && Brand.find_by(brand_identifier: data_hash[:brand_info][:brand_identifier]).brand_category_items.build(data_hash[:categorization_info]).save!
      puts "#{data_hash[:brand_info][:name]} created!"

      if create_brand.logo.attach(data_hash[:logo_info])
        puts "\tLogo successfully attached! [#{data_hash[:logo_info][:filename]} -> #{data_hash[:brand_info][:brand_identifier]}]\n"
      end # create_brand.logo.attach
    else
      puts "Error: Brand #{data_hash[:brand_info][:name]} was not created!\n"
    end # create_brand.save! && ...
  else
    puts "Error: Account #{data_hash[:brand_info][:name]} was not created!\n"
  end # create_account.save!

else
  puts "Error: User #{data_hash[:user_info][:username]} not created!\n"
end # create_user.save!
