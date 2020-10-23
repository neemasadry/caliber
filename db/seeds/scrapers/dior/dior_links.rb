# Initialize Mechanize
agent                       = Mechanize.new
agent.history_added         = Proc.new { sleep 0.5 }
product_agent               = Mechanize.new
product_agent.history_added = Proc.new { sleep 0.5 }

# Set constants
BRAND_DOMAIN            = "https://www.dior.com/en_us"
BRAND_IDENTIFIER        = "dior"
BRAND_NAME              = "Dior"
BRAND_OBJECT            = Brand.find_by(brand_identifier: BRAND_IDENTIFIER)
BRAND_REFERENCE         = BRAND_OBJECT.id
SCRAPER_BRAND_OBJECT    = ScraperBrand.find_by(brand_identifier: BRAND_IDENTIFIER)
SCRAPER_BRAND_REFERENCE = SCRAPER_BRAND_OBJECT.id

presence_of_links              = BuiltLink.all.where(brand_id: BRAND_REFERENCE)
presence_of_scraper_links      = ScraperBuiltLink.all.where(scraper_brand_id: BRAND_REFERENCE)
presence_of_dior_links = PeteAndPedroBuiltLink.all.where(scraper_brand_id: BRAND_REFERENCE)

size_of_built_links         = presence_of_links.size
size_of_scraper_built_links = presence_of_scraper_links.size
size_of_dior_built_links = presence_of_peteandpedro_links.size

puts "----------------------------------------------------------------------------------------------------"

if size_of_built_links >= 1 || size_of_scraper_built_links >= 1 || size_of_peteandpedro_built_links >= 1
  puts "BuiltLink: \t#{size_of_built_links} links present."
  puts "ScraperBuiltLink: \t#{size_of_scraper_built_links} links present."
  puts "DiorBuiltLink: \t#{size_of_peteandpedro_built_links} links present."

  presence_of_links.delete_all
  presence_of_scraper_links.delete_all
  presence_of_dior_links.delete_all

  size_of_built_links = presence_of_links.size
  size_of_scraper_built_links = presence_of_scraper_links
  size_of_dior_built_links = presence_of_peteandpedro_links.size

  if size_of_built_links == 0 && size_of_scraper_built_links && size_of_dior_built_links
    puts "\tAll links for #{BRAND_OBJECT.name} have been destroyed."
  else
    puts "\tError: Links have not been deleted!"
  end

else
  puts "\tNo presence of links for #{BRAND_OBJECT.name}"
end

puts "----------------------------------------------------------------------------------------------------\n\n"


total_counter = 1

# Scraping logic...

BuiltLink.create(
  product_name:   nil,
  product_url:    nil,
  brand_id:       nil,
  body_part_id:   nil,
  category_id:    nil,
  subcategory_id: nil
)

ScraperBuiltLink.create(
  product_name: nil,
  product_url: nil,
  scraper_brand_id: nil,
  body_part: nil,
  category: nil,
  subcategory: nil
)

DiorBuiltLink.create(
  product_name: nil,
  product_url: nil,
  scraper_brand_id: nil,
  body_part: nil,
  category: nil,
  subcategory: nil
)

puts "\n----------------------------------------------------------------------------------------"
puts "Built #{total_counter} product URLs under #{BRAND_NAME}"
puts "----------------------------------------------------------------------------------------"
