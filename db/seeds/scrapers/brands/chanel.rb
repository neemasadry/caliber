data_hash = {
  brand_info: {
    user_id: User.find_by(username: "...").id,
    account_id: Account.find_by(name: "Chanel").id,
    name: "Chanel",
    brand_identifier: "chanel",
    founding_date: "...",
    about: Faker::Lorem.paragraphs(4..7).join(" "),
    price_range: 2,
    homepage_link: "https://www.chanel.com/us/",
    email: "...",
    story: "",
    mission: "",
    phone: "",
    address1: "",
    address2: "",
    city: "",
    state_code: "",
    country_code: "",
    zipcode: "",
    instagram_link: "https://www.instagram.com/.../",
    youtube_link: "https://www.youtube.com/user/...",
    facebook_link: "https://www.facebook.com/.../",
    twitter_link: "https://twitter.com/.../",
    snapchat_link: "https://www.snapchat.com/add/...",
    tiktok_link: "https://www.tiktok.com/@...",
  },
  logo_info: {
    io: File.open(Rails.root.join(logo_path, "...")),
    filename: "...",
    content_type: "..."
  },
  categorization_info: {
    category_id: Category.find_by(name: "...").id
  }
}

create_brand = Brand.new(data_hash[:brand_info])

if create_brand.save! && Brand.find_by(brand_identifier: data_hash[:brand_info][:brand_identifier]).brand_category_items.build(data_hash[:categorization_info]).save!

  puts "#{data_hash[:brand_info][:name]} created!"

  if create_brand.logo.attach(data_hash[:logo_info])
    puts "\tLogo successfully attached! [#{data_hash[:logo_info][:filename]} -> #{data_hash[:brand_info][:brand_identifier]}]\n"
  end
end



