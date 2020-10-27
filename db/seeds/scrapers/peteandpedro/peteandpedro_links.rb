require 'csv'

# Initialize Mechanize
agent                       = Mechanize.new
agent.history_added         = Proc.new { sleep 0.5 }
product_agent               = Mechanize.new
product_agent.history_added = Proc.new { sleep 0.5 }

# Set constants
BRAND_DOMAIN             = "https://peteandpedro.com"
BRAND_IDENTIFIER         = "peteandpedro"
BRAND_NAME               = "Pete & Pedro"
BRAND_OBJECT             = Brand.find_by(brand_identifier: BRAND_IDENTIFIER)
BRAND_REFERENCE          = BRAND_OBJECT.id

COLLECTIONS              = "/collections/"
SCRAPER_BRAND_OBJECT     = ScraperBrand.find_by(brand_identifier: BRAND_IDENTIFIER)
SCRAPER_BRAND_REFERENCE  = SCRAPER_BRAND_OBJECT.id

CSV_PATH                 = "db/seeds/scrapers/peteandpedro/files/csvs/"
current_timestamp        = Time.now.strftime("%Y%m%d%H") # Time format: YYYY MM DD HH (no spaces)

presence_of_links              = BuiltLink.all.where(brand_id: BRAND_REFERENCE)
presence_of_scraper_links      = ScraperBuiltLink.all.where(scraper_brand_id: BRAND_REFERENCE)
presence_of_peteandpedro_links = PeteAndPedroBuiltLink.all.where(scraper_brand_id: BRAND_REFERENCE)

size_of_built_links              = presence_of_links.size
size_of_scraper_built_links      = presence_of_scraper_links.size
size_of_peteandpedro_built_links = presence_of_peteandpedro_links.size

collections = {
  "styling-aids": { body_part: BodyPart.find_by(name: "Crown"), category: Category.find_by(name: "Hair"), subcategory: Subcategory.find_by(name: "Styling") },
  "body-wash":    { body_part: BodyPart.find_by(name: "Crown"), category: Category.find_by(name: "Hygiene"), subcategory: Subcategory.find_by(name: "Body wash") },
  "shampoos":     { body_part: BodyPart.find_by(name: "Crown"), category: Category.find_by(name: "Hygiene"), subcategory: Subcategory.find_by(name: "Shampoo") },
  "conditioners": { body_part: BodyPart.find_by(name: "Crown"), category: Category.find_by(name: "Hygiene"), subcategory: Subcategory.find_by(name: "Conditioner") },
  "shave":        { body_part: BodyPart.find_by(name: "Face"), category: Category.find_by(name: "Shaving"), subcategory: Subcategory.find_by(name: "Shaving cream") },
  "beards":       { body_part: BodyPart.find_by(name: "Face"), category: Category.find_by(name: "Shaving"), subcategory: Subcategory.find_by(name: "Beard oil") },
  "tools":        { body_part: BodyPart.find_by(name: "N/A"), category: Category.find_by(name: "Shaving"), subcategory: Subcategory.find_by(name: "Other") },
  "lifestyle":    { body_part: BodyPart.find_by(name: "N/A"), category: Category.find_by(name: "Shaving"), subcategory: Subcategory.find_by(name: "Other") },
}


puts "----------------------------------------------------------------------------------------------------"

if size_of_built_links >= 1 || size_of_scraper_built_links >= 1 || size_of_peteandpedro_built_links >= 1
  puts "\t#{size_link_present} links present."
  puts "ScraperBuiltLink: \t#{size_of_scraper_built_links} links present."
  puts "PeteAndPedroBuiltLink: \t#{size_of_peteandpedro_built_links} links present."

  presence_of_links.delete_all
  presence_of_scraper_links.delete_all
  presence_of_peteandpedro_links.delete_all

  size_of_built_links              = presence_of_links.size
  size_of_scraper_built_links      = presence_of_scraper_links.size
  size_of_peteandpedro_built_links = presence_of_peteandpedro_links.size

  if size_of_built_links == 0 && size_of_scraper_built_links == 0 && size_of_peteandpedro_built_links == 0
    puts "\tAll links for #{BRAND_OBJECT.name} have been destroyed."
  else
    puts "\tError: Links have not been deleted!"
  end

else
  puts "\tNo presence of links for #{BRAND_OBJECT.name}"
end

puts "----------------------------------------------------------------------------------------------------\n\n"


total_counter = 1
collections.each do |collection_key, collection_values_hash|
  full_path     = BRAND_DOMAIN + COLLECTIONS + collection_key.to_s
  page          = agent.get(full_path)
  product_links = page.links_with(href: %r{/collections/#{collection_key.to_s}/products/})
  counter       = 1

  product_links.each do |product_link|
    full_product_path           = BRAND_DOMAIN + product_link.href

    product_entry               = BuiltLink.find_by(product_url: full_product_path)
    scraper_product_entry       = ScraperBuiltLink.find_by(product_url: full_product_path)
    peteandpedro_product_entry  = PeteAndPedroBuiltLink.find_by(product_url: full_product_path)

    next if full_product_path.include?("set") || full_product_path.include?("pack") || full_product_path.include?("kit")
    next if full_product_path.include?("https://peteandpedro.com/https://peteandpedro.com")
    next if full_product_path.include?("https://peteandpedro.comhttps://peteandpedro.com")
    next if full_product_path.include?("https://peteandpedro.com/collections/beards/products/copy-of-beard-oil")
    next if full_product_path.include?("trifecta") || full_product_path.include?("combo")

    product_page_agent = product_agent.get(full_product_path)
    product_name       = product_page_agent.xpath("/html/body/div[3]/main/div[2]/div[2]/div[2]/div[1]/h1").text.strip

    if !product_entry.present?
      puts full_product_path
      BuiltLink.create(
        product_name:   product_name,
        product_url:    full_product_path,
        brand_id:       BRAND_REFERENCE,
        body_part_id:   collection_values_hash[:body_part].id,
        category_id:    collection_values_hash[:category].id,
        subcategory_id: collection_values_hash[:subcategory].id,
        gender:         1
      )
      counter += 1
      total_counter += 1
    else
      next
    end

    if !scraper_product_entry.present?
      ScraperBuiltLink.create(
        product_name:     product_name,
        product_url:      full_product_path,
        scraper_brand_id: SCRAPER_BRAND_REFERENCE,
        body_part:        collection_values_hash[:body_part].name,
        category:         collection_values_hash[:category].name,
        subcategory:      collection_values_hash[:subcategory].name,
        gender:           1
      )
    else
      next
    end

    if !peteandpedro_product_entry.present?
      PeteAndPedroBuiltLink.create(
        product_name:     product_name,
        product_url:      full_product_path,
        scraper_brand_id: SCRAPER_BRAND_REFERENCE,
        body_part:        collection_values_hash[:body_part].name,
        category:         collection_values_hash[:category].name,
        subcategory:      collection_values_hash[:subcategory].name,
        gender:           1
      )
    else
      next
    end

  end # page_values_arr.each

  puts "----------------------------------------------------------------------------------------"
  puts "\t #{collection_key} has #{counter} links."
  puts "----------------------------------------------------------------------------------------\n\n"

end


puts "\n----------------------------------------------------------------------------------------"
puts "Built #{total_counter} product URLs under #{BRAND_NAME} [#{BRAND_DOMAIN}]"
puts "----------------------------------------------------------------------------------------"


# Export data to CSV for back-up
csv_filename = "#{current_timestamp}_peteandpedro_links.csv"
csv_file = Rails.root.join(CSV_PATH, csv_filename)
peteandpedro_built_links = PeteAndPedroBuiltLink.all

CSV.open(csv_file, "wb") do |csv|
  csv << ["built_link_id", "product_name", "product_url", "scraper_brand_id", "body_part", "category", "subcategory", "gender"]

  csv_write_counter = 0
  peteandpedro_built_links.each do |link_obj|
    csv << [link_obj.id, link_obj.product_name, link_obj.product_url, link_obj.scraper_brand_id, link_obj.body_part,  link_obj.category, link_obj.subcategory, link_obj.gender]
    csv_write_counter += 1
  end

  puts "#{csv_write_counter} link objects saved in #{csv_filename}."
end
