# Initialize Mechanize agent
agent                   = Mechanize.new
agent.history_added     = Proc.new { sleep 0.5 }

# Variables
subcounter              = 1
total_counter           = 1

built_links             = BuiltLink.all.where(brand_id: BRAND_REFERENCE)

product_entries         = Product.all.where(brand_id: BRAND_REFERENCE)
scraper_product_entries = ScraperProduct.all.where(scraper_brand_id: BRAND_REFERENCE)
dior_product_entries    = Dior.all.where(scraper_brand_id: BRAND_REFERENCE)

size_of_product_entries         = product_entries.size
size_of_scraper_product_entries = scraper_product_entries.size
size_of_dior_product_entries    = dior_product_entries.size



# Destroy all previous product entries in the DB
if size_of_product_entries >= 1 && size_of_scraper_product_entries >= 1 && size_of_dior_product_entries >=1
  product_entries.destroy_all
  scraper_product_entries.destroy_all
  dior_product_entries.destroy_all

  puts "\n\t[#{BRAND_NAME}] Product: #{size_of_product_entries} #{BRAND_NAME} products deleted from the database.\n"
  puts "\n\t[#{BRAND_NAME}] ScraperProduct: #{size_of_scraper_product_entries} #{BRAND_NAME} products deleted from the database.\n"
  puts "\n\t[#{BRAND_NAME}] DiorProduct: #{size_of_dior_product_entries} #{BRAND_NAME} products deleted from the database.\n"
else
  puts "\n#{BRAND_NAME} has no products.\n"
end

built_links.each do |built_link|
  page            = agent.get(built_link.product_url)

  p_name          = page.xpath("/html/body/div[1]/div[1]/main/div/div[1]/div[2]/div/div[2]/div[1]/h1/span[1]").text.strip
  p_brand         = BRAND_REFERENCE
  p_description   = page.xpath("/html/body/div[1]/div[1]/main/div/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/div").text.strip
  p_retail_price  = page.xpath("/html/body/div[1]/div[1]/main/div/div[1]/div[2]/div/div[2]/div[2]/div[2]/span[1]").text.strip
  p_gender        = nil
  p_type_of       = nil
  p_ingredients   = nil

  # Categorization
  p_body_part     = built_link.body_part_id
  p_category      = built_link.category_id
  p_subcategory   = built_link.subcategory_id

  tempfile_folder_name = "#{current_timestamp}_#{BRAND_IDENTIFIER}_images"
  tempfile_path = FILES_PATH + "/" + tempfile_folder_name
  FileUtils.mkdir(tempfile_path) unless File.exists?(tempfile_path)

  product_image_data = []
  scraper_image_data = []
  dior_image_data    = []

  page.search("...").each do |img|
    product_image_datum = {}
    scraper_image_datum = {}
    dior_image_datum    = {}

    img_src = img['src'].gsub("//", "https://")

    # 1) Download image 2) Construct full path for tempfile (Down object) and include original filename 3) Move tempfile to save it on disk
    tempfile = Down.download(img_src)
    tempfile_path_filename = "#{tempfile_path}/#{tempfile.original_filename}"
    FileUtils.mv(tempfile.path, tempfile_path_filename)

    product_image_datum[:io]                = File.open(tempfile_path_filename)
    product_image_datum[:filename]          = tempfile.original_filename
    product_image_datum[:content_type]      = tempfile.content_type

    scraper_image_datum[:io]                = File.open(tempfile_path_filename)
    scraper_image_datum[:filename]          = tempfile.original_filename
    scraper_image_datum[:content_type]      = tempfile.content_type

    dior_image_datum[:io]           = File.open(tempfile_path_filename)
    dior_image_datum[:filename]     = tempfile.original_filename
    dior_image_datum[:content_type] = tempfile.content_type

    product_image_data << product_image_datum
    scraper_image_data << scraper_image_datum
    dior_image_data    << dior_image_datum

  end # page.search("#ProductPhotoImg").each

  puts "-----------------------------Begin-------------------------------"
  puts "Before Create: #{p_name} - #{built_link.product_url}"

  created_scraper_product = DiorProduct.create(
    name:                p_name,
    description:         p_description,
    retail_price:        p_retail_price,
    gender:              p_gender,
    type_of:             p_type_of,
    product_url:         built_link.product_url,
    #PRODUCT_TYPE_attributes: { ... },
    user_id:             BRAND_OBJECT.user.id,
    account_id:          BRAND_OBJECT.account.id,
    brand_id:            BRAND_REFERENCE
  )

  image_data.each do |img_hash|
    created_product.scraped_images.attach(img_hash)
  end

  created_scraper_product = ScraperProduct.create(
    name:                p_name,
    description:         p_description,
    retail_price:        p_retail_price,
    gender:              p_gender,
    type_of:             p_type_of,
    product_url:         built_link.product_url,
    cosmetic_attributes: { ingredients: p_ingredients },
    username:            BRAND_OBJECT.user.username,
    account_name:        BRAND_OBJECT.account.name,
    scraper_brand_id:    SCRAPER_BRAND_REFERENCE
  )

  scraper_image_data.each do |img_hash|
    created_scraper_product.images.attach(img_hash)
  end

  created_dior_product = PeteAndPedroProduct.create(
    name:                p_name,
    description:         p_description,
    retail_price:        p_retail_price,
    gender:              p_gender,
    type_of:             p_type_of,
    product_url:         built_link.product_url,
    cosmetic_attributes: { ingredients: p_ingredients },
    username:            "alpham",
    account_name:        BRAND_NAME,
    scraper_brand_id:    SCRAPER_BRAND_REFERENCE
  )

  dior_image_data.each do |img_hash|
    created_dior_product.images.attach(img_hash)
  end

  ProductBodyPartItem.new(product_id: created_product.id, body_part_id: p_body_part).save
  ProductCategoryItem.new(product_id: created_product.id, category_id: p_category).save
  ProductSubcategoryItem.new(product_id: created_product.id, subcategory_id: p_subcategory).save

  puts "[#{subcounter}] #{p_name} (Category #: #{built_link.category_id}) - #{built_link.product_url}"
  puts "---------------------------------END----------------------------\n\n"

  subcounter    += 1
  total_counter += 1

end # BuiltLink.all.where(brand_id: BRAND_REFERENCE).each

puts "\n----------------------------------------------------------------------------------------"
puts "Built #{total_counter} product URLs under #{BRAND_FORMAL} [#{DOMAIN}]"
puts "----------------------------------------------------------------------------------------"
