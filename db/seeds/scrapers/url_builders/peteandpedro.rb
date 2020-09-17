agent = Mechanize.new
agent.history_added = Proc.new { sleep 1 }
BRAND = "peteandpedro"
DOMAIN = "https://peteandpedro.com"
COLLECTIONS = "/collections/"
BRAND_REFERENCE = Brand.find_by(brand_identifier: BRAND)


presence_of_links = BuiltLink.all.where(brand_id: BRAND_REFERENCE)
size_link_present = presence_of_links.size

if size_link_present >= 1
  puts "#{size_link_present} links present."
  presence_of_links.delete_all
  size_link_present = presence_of_links.size
  if size_link_present == 0
    puts "All links for #{BRAND_REFERENCE.name} have been deleted."
  else
    puts "Error: Links have not been deleted!"
  end
else
  puts "No presence of links for #{BRAND_REFERENCE.name}"
end

collections = [
  "styling-aids",
  "body-wash",
  "shampoos",
  "conditioners",
  "shave",
  "beards",
  "tools",
  "lifestyle",
]

#pages_collections = agent.get(DOMAIN + "/collections/")

page_paths = []
collections.each do |collection|
  full_path = DOMAIN + COLLECTIONS + collection
  puts full_path
  page_paths << full_path
end

page_paths_with_collections = page_paths.zip collections

all_product_urls = []

page_paths_with_collections.each do |page_path, collection|
  page = agent.get(page_path)

  product_links = page.links_with(href: %r{/collections/#{collection}/products/})

  product_links.each do |product_link|
    next if product_link.href.include?("set")

    full_path = DOMAIN + product_link.href

    next if full_path.include?("https://peteandpedro.comhttps://peteandpedro.com")

    all_product_urls << [full_path, (collection.split("-").map(&:capitalize).join(" "))]
  end # product_links.each
end # page_paths.each

# test_counter = 1
# all_product_urls.uniq!.each do |test_url, test_category|
#   puts "#{test_counter} #{test_category}: #{test_url}"
#   test_counter += 1
# end


if all_product_urls.uniq!
  puts "all_product_urls are now unique!"

  counter = 1
  all_product_urls.each do |full_path, product_category|
    if full_path.include?("set")
      puts "#{counter} #{product_category}: " + full_path + " (Set: TRUE)"
    else
      BuiltLink.create!(
        product_url: full_path,
        category: product_category,
        brand_id: BRAND_REFERENCE.id
      )

      puts "#{counter} #{product_category}: " + full_path
    end
    counter += 1
  end
else
  puts "Error: not unique!"
end
