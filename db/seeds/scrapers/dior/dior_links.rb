# Initialize Mechanize
agent                       = Mechanize.new
agent.history_added         = Proc.new { sleep 0.5 }
product_agent               = Mechanize.new
product_agent.history_added = Proc.new { sleep 0.5 }

# Set constants
BRAND_DOMAIN            = "https://www.dior.com"
BRAND_DOMAIN_I18N       = "https://www.dior.com/en_us"
BRAND_IDENTIFIER        = "dior"
BRAND_NAME              = "Dior"
BRAND_OBJECT            = Brand.find_by(brand_identifier: BRAND_IDENTIFIER)
BRAND_REFERENCE         = BRAND_OBJECT.id
SCRAPER_BRAND_OBJECT    = ScraperBrand.find_by(brand_identifier: BRAND_IDENTIFIER)
SCRAPER_BRAND_REFERENCE = SCRAPER_BRAND_OBJECT.id

presence_of_links         = BuiltLink.all.where(brand_id: BRAND_REFERENCE)
presence_of_scraper_links = ScraperBuiltLink.all.where(scraper_brand_id: BRAND_REFERENCE)
presence_of_dior_links    = DiorBuiltLink.all.where(scraper_brand_id: BRAND_REFERENCE)

size_of_built_links         = presence_of_links.size
size_of_scraper_built_links = presence_of_scraper_links.size
size_of_dior_built_links    = presence_of_dior_links.size

puts "----------------------------------------------------------------------------------------------------"
=begin
if size_of_built_links >= 1 || size_of_scraper_built_links >= 1 || size_of_dior_built_links >= 1

  puts "BuiltLink: \t#{size_of_built_links} links present."
  puts "ScraperBuiltLink: \t#{size_of_scraper_built_links} links present."
  puts "DiorBuiltLink: \t#{size_of_dior_built_links} links present."

  presence_of_links.delete_all
  presence_of_scraper_links.delete_all
  presence_of_dior_links.delete_all

  size_of_built_links = presence_of_links.size
  size_of_scraper_built_links = presence_of_scraper_links
  size_of_dior_built_links = presence_of_dior_links.size

  if size_of_built_links == 0 && size_of_scraper_built_links && size_of_dior_built_links
    puts "\tAll links for #{BRAND_OBJECT.name} have been destroyed."
  else
    puts "\tError: Links have not been deleted!"
  end

else
  puts "\tNo presence of links for #{BRAND_OBJECT.name}"
end
=end
puts "----------------------------------------------------------------------------------------------------\n\n"

def determine_body_part(category, subcategory)
  if category == "shoes" || subcategory == "socks"
    body_part = BodyPart.find_by(name: "Feet").id
  elsif category == "sunglasses"
    body_part = BodyPart.find_by(name: "Eyes").id
  elsif category == "earrings"
    body_part = BodyPart.find_by(name: "Ears").id
  elsif ["necklaces", "silk-scarves-mitzah", "scarves-stoles"].include?(subcategory)
    body_part = BodyPart.find_by(name: "Neck").id
  elsif category == "belts"
    body_part = BodyPart.find_by(name: "Waist").id
  elsif subcategory == "bracelets"
    body_part = BodyPart.find_by(name: "Wrists").id
  elsif subcategory == "rings"
    body_part = BodyPart.find_by(name: "Fingers").id
  elsif subcategory == "engagement-wedding-rings"
    body_part = BodyPart.find_by(name: "Left Ring Finger").id
  elsif subcategory == "hats-baseball-caps"
    body_part = BodyPart.find_by(name: "Crown").id
  else
    body_part = BodyPart.find_by(name: "N/A").id
  end

  return body_part
end

def determine_category(category)
  if ["accessory", "bags", "leather-goods"].include?(category)
    associated_category = Category.find_by(name: "Accessory").id
  elsif ["fashion-jewelry", "fine-jewelry"]
    associated_category = Category.find_by(name: "Jewelry/Watches").id
  elsif category == "ready-to-wear"
    associated_category = Category.find_by(name: "Clothing").id
  else
    associated_category = nil
  end

  return associated_category
end

nav_categories = {
=begin
  "womens-fashion": {
    bags: [ "handbags", "tote-bags", "mini-bags-belt-bags", "messengers-backpacks" ],
    "ready-to-wear": [ "jackets", "coats", "dresses", "skirts", "tops", "pants-shorts", "knitwear", "t-shirts", "denim", "lingerie" ],
    shoes: [ "pumps", "sneakers", "mules", "espadrilles", "flat-shoes", "sandals", "boots" ], # change "slides" to "mules"
    "fashion-jewelry": [ "earrings", "necklaces", "bracelets", "rings", "brooches" ],
    accessories: [ "sunglasses", "evening-bags", "wallets-small-accessories", "straps", "belts", "ponchos", "silk-scarves-mitzah", "scarves-stoles", "hats-gloves", "beach-accessories" ],
    "fine-jewelry": [ "rings", "earrings", "necklaces", "bracelets", "engagement-wedding-rings" ]
  },
  "mens-fashion": {
    # "ready-to-wear": [ "suits-tuxedos", "suit-jackets", "jackets-coats-leathers", "sweaters-sweatshirts", "shirts", "t-shirts-polos", "denim", "trousers-shorts" ],
    # "leather-goods": [ "shoulder-bags", "backpacks", "tote-bags", "briefcases-messenger-bags", "pouches", "travel-bags" ],
    # shoes: [ "sneakers", "boots-ankle-boots", "derby-shoes-oxford-loafers", "sandals" ],
    # accessories: [ "sunglasses", "wallets-card-holders", "phone-cases-high-tech-accessories", "key-rings", "sneaker-charms", "fashion-jewelry", "cufflinks-other-accessories", "belts-gloves", "hats-baseball-caps", "scarves-bandanas-blankets" ] # , "ties-bow-ties-pocket-squares", "socks"
  },
=end
=begin HERE!!!!!!!!!!!!!
  fragrance: {
    "womens_fragrance": ["all-products"],
    "mens-fragrance": ["all-products"]
  },
  makeup: {
    "complexion": ["all-products"],
    "eyes": ["all-products"],
    "lips": ["all-products"],
    "nails": ["all-products"]
  },
  skincare: {
    "categories": ["all-skincare-products"]
  },
  # maison: {}
=end
}

product_entries = []
nav_categories.each do |category_group_key, category_group_values|

  category_group_values.each do |category_key, category_values|

    category_values.each do |subcategory|
      subcategory_path = "#{BRAND_DOMAIN_I18N}/#{category_group_key}/#{category_key}/#{subcategory}"
      product_entry = [subcategory_path, category_group_key, category_key, subcategory]

      product_entries << product_entry
      # puts product_entry.inspect
      # puts "\n\n"
    end # category_values.each
  end # category_group_values.each
end # nav_categories.each

total_counter = 1

# dior_links = BuiltLink.all.where(brand_id: BRAND_REFERENCE)

product_entries.each do |product_entry|
  page = agent.get(product_entry[0])

  product_page_links = page.links_with(class: "product-link")

  counter = 1
  product_page_links.each do |product_page_link|
    product_page_link_full_path = BRAND_DOMAIN + product_page_link.href

    product_page = product_agent.get(product_page_link_full_path)
    product_name = product_page.xpath("/html/body/div[1]/div[1]/main/div/div[1]/div[2]/div/div[2]/div[1]/h1/span[1]").text.strip

    #next if dior_links.find_by(product_name: product_name).present? || dior_links.find_by(product_url: product_page_link_full_path).present?
    next if BuiltLink.exists?(product_url: product_page_link_full_path)

    created_link = BuiltLink.create(
      product_name:   product_name,
      product_url:    product_page_link_full_path,
      brand_id:       BRAND_REFERENCE,
      body_part_id:   determine_body_part(product_entry[2], product_entry[3]),
      category_id:    determine_category(product_entry[2]),
      subcategory_id: nil
    )

    ScraperBuiltLink.create(
      product_name:     product_name,
      product_url:      product_page_link_full_path,
      scraper_brand_id: BRAND_REFERENCE,
      body_part:     determine_body_part(product_entry[2], product_entry[3]),
      category:      determine_category(product_entry[2]),
      subcategory:   nil
    )

    DiorBuiltLink.create(
      product_name:     product_name,
      product_url:      product_page_link_full_path,
      scraper_brand_id: BRAND_REFERENCE,
      body_part:        determine_body_part(product_entry[2], product_entry[3]),
      category:         determine_category(product_entry[2]),
      subcategory:      nil
    )

    puts "(#{counter}) #{product_name}: #{product_page_link_full_path}"
    counter += 1
    total_counter += 1
  end # product_page_links.each

  puts "----------------------------------------------------------------------------------------"
  puts "Built #{counter} product URLs under #{product_entry[3]} - #{product_entry[2]} - #{BRAND_NAME}"
  puts "----------------------------------------------------------------------------------------\n\n"

end # array_of_product_entries_hashes.each


puts "\n----------------------------------------------------------------------------------------"
puts "Built #{total_counter} product URLs under #{BRAND_NAME}"
puts "----------------------------------------------------------------------------------------"
