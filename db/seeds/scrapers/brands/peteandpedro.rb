data_hash = {
  brand_info: {
    user_id: User.find_by(username: "alpham").id,
    account_id: Account.find_by(name: "Pete & Pedro").id,
    name: "Pete & Pedro",
    brand_identifier: "peteandpedro",
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
}

create_brand = Brand.new(data_hash[:brand_info])

if create_brand.save! && Brand.find_by(brand_identifier: data_hash[:brand_info][:brand_identifier]).brand_category_items.build(data_hash[:categorization_info]).save!

  puts "#{data_hash[:brand_info][:name]} created!"

  if create_brand.logo.attach(data_hash[:logo_info])
    puts "\tLogo successfully attached! [#{data_hash[:logo_info][:filename]} -> #{data_hash[:brand_info][:brand_identifier]}]\n"
  end
end



