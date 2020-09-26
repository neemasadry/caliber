# Initialize Mechanize
agent                       = Mechanize.new
agent.history_added         = Proc.new { sleep 0.5 }
product_agent               = Mechanize.new
product_agent.history_added = Proc.new { sleep 0.5 }

# Set constants
BRAND_DOMAIN                = "https://us.burberry.com/beta/?selected=Y"
BRAND_ID                    = "burberry"
BRAND_NAME                  = "Burberry"
BRAND_OBJECT                = Brand.find_by(brand_identifier: BRAND_ID)
BRAND_REFERENCE             = BRAND_OBJECT.id

presence_of_links = BuiltLink.all.where(brand_id: BRAND_REFERENCE)
size_link_present = presence_of_links.size

puts "----------------------------------------------------------------------------------------------------"
if size_link_present >= 1
  puts "\t#{size_link_present} links present."
  presence_of_links.delete_all
  size_link_present = presence_of_links.size
  if size_link_present == 0
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

puts "\n----------------------------------------------------------------------------------------"
puts "Built #{total_counter} product URLs under #{BRAND_NAME} [#{BRAND_DOMAIN}]"
puts "----------------------------------------------------------------------------------------"
