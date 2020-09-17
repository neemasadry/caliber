BRAND_NAME = "peteandpedro"
PRODUCTS_FILES_PATH = File.expand_path('../files/', File.dirname(__FILE__)) # Pathname("../files/#{BRAND_NAME}")
puts PRODUCTS_FILES_PATH
BRAND_REFERENCE = Brand.find_by(brand_identifier: BRAND_NAME)
# Time format: YYYY MM DD HH (no spaces)
current_timestamp = Time.now.strftime("%Y%m%d")

# Open CSV file created from the URL Builder script
# opened_csv_file = IO.readlines(URLS_CSV_FILE_PATH + "/#{BRAND_NAME}.csv").drop(1)
# opened_csv_file = CSV.parse(URLS_CSV_FILE_PATH + "/#{BRAND_NAME}.csv", headers: true, encoding: "utf-8")

agent = Mechanize.new
agent.history_added = Proc.new { sleep 0.5 }


counter = 1
product_entries = []

built_links = BuiltLink.all.where(brand_id: BRAND_REFERENCE.id)

built_links.each do |built_link|
  page = agent.get(built_link.product_url)

  p_name = page.xpath("/html/body/div[3]/main/div[2]/div[2]/div[2]/div[1]/h1").text.strip

  p_brand = BRAND_REFERENCE.id

  p_description = page.css(".product-description").text.strip

  p_retail_price = page.at("#ProductPrice")['content']

  p_gender = "Male"

  p_ingredients = page.search("div.ingredients").map{|x| x.text.strip} #.delete!("\n")

  # Categorization

  if Rails.env.production?
    product_entry = {
      name: p_name,
      brand: p_brand,
      description: p_description,
      retail_price: p_retail_price,
      gender: p_gender,
      ingredients: p_ingredients,
      category: built_link.category,
      product_url: built_link.product_url,
    }

  else
    tempfile_path = "#{PRODUCTS_FILES_PATH}/#{current_timestamp}_product_images/"
    FileUtils.mkdir(tempfile_path) unless File.exists?(tempfile_path)

    image_data = []
    page.search("#ProductPhotoImg").each do |img|
      image_data_hash = {}
      img_src = img['src'].gsub("//", "https://")
      img_alt = img['alt']

      # Download image
      tempfile = Down.download(img_src)
      # Construct full path for tempfile (Down object) and include original filename
      tempfile_path_filename = "#{tempfile_path}/#{tempfile.original_filename}"
      # Move tempfile to save it on disk
      FileUtils.mv(tempfile.path, tempfile_path_filename)

      image_data_hash[:src] = img_src
      image_data_hash[:alt] = img_alt
      image_data_hash[:relative_path] = tempfile_path_filename

      image_data << image_data_hash

      product_entry = {
        name: p_name,
        description: p_description,
        retail_price: p_retail_price,
        gender: p_gender,
        ingredients: p_ingredients,
        category: built_link.category,
        product_url: built_link.product_url,
        image_data: image_data,
        brand: p_brand
      }

      product_entries << product_entry

      puts "----------------------------------------------------------------"
      puts tempfile_path_filename
      puts "#{counter}) #{built_link.category} - #{built_link.product_url}"
      puts "----------------------------------------------------------------"
    end # page.search("#ProductPhotoImg").each do |img|
  end # Rails.env.production?

  counter += 1

  break if counter == 5

end # BuiltLink.all.where(brand_id: BRAND_REFERENCE).each



product_entries.each do |entry|

  product_present = Product.find_by(
    name: entry[:name],
    brand_id: BRAND_REFERENCE.id
  )

  if product_present.present?
    product_present.destroy
    puts " DESTROYED #{product_present.name} - #{product_present.brand.name}"
  end

  next if entry[:category] == "Tools" || entry[:category] == "Lifestyle"

  created_cosmetic = Cosmetic.create!(
    name: entry[:name],
    description: entry[:description],
    retail_price: entry[:retail_price],
    gender: entry[:gender],
    ingredients: entry[:ingredients],
    product_url: entry[:product_url],
    user_id: BRAND_REFERENCE.user.id,
    account_id: BRAND_REFERENCE.account.id,
    brand_id: BRAND_REFERENCE.id
  )

  Product.create!(
    name: entry[:name],
    productable: created_cosmetic,
    user_id: BRAND_REFERENCE.user.id,
    account_id: BRAND_REFERENCE.account.id,
    brand_id: BRAND_REFERENCE.id
  )

end

# puts "\n\n\n"
# puts "-------------------"
# puts product_entries.inspect
# puts "-------------------\n\n\n"

# File.delete("#{PRODUCTS_CSV_FILE_PATH}/peteandpedro.csv") if File.exists?("#{PRODUCTS_CSV_FILE_PATH}/peteandpedro.csv")

# CSV.open(PRODUCTS_CSV_FILE_PATH + "/#{BRAND_NAME}.csv", "w", { write_headers: true, headers: product_entries.first.keys, col_sep: "," }) do |row|
#   product_entries.each do |row_entry|
#     puts row_entry.values
#     row << row_entry.values
#   end
# end
