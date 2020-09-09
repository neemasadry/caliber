require 'csv'

Accessory.destroy_all

brand_entry = Brand.find_by(name: "Jade Black")
user_entry = User.find_by(email: "jzuniga@gmail.com")
account_entry = Account.find_by(name: "Jade Black", personal: false)

counter = 1

jade_black_csv_text = File.read(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Crawl-Run)---2020-03-28T163728Z.csv'))
csv = CSV.parse(jade_black_csv_text, headers: true, encoding: "utf-8")
puts "---------------- Begin: Accessory ----------------"
csv.each do |row|

=begin
  # Create associated Product object
  Product.new(
    name: row['name'],
    user_id: user_entry.id,
    account_id: account_entry.id,
    brand_id: brand_entry.id,
  ).build_accessory(
    name: row['name'],
    brand_id: brand_entry.id,
    description: row['description'],
    retail_price: row['retail_price'],

    gender: "Male",
    materials: row['material'],
    primary_color: "N/A",
    secondary_color: "N/A",
    product_url: row['url'],
    user_id: user_entry.id,
    account_id: account_entry.id
  ).save!
=end

  puts "-- Accessory No. #{counter} -- \n\n"

  t = Accessory.new
  t.name = row['name']
  t.brand_id = brand_entry.id
  t.description = row['description']
  t.retail_price = row['retail_price']

  t.gender = "Male"
  t.materials = row['material']
  t.primary_color = "N/A"
  t.secondary_color = "N/A"
  t.product_url = row['url']
  t.user_id = user_entry.id
  t.account_id = account_entry.id

  if t.save!

    # puts "\t --- Begin: Upload associated product images ---\n"
    image1_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image1_filename']))
    image2_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image2_filename']))
    imageDemo_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['imageDemo_filename']))

    # ### Begin: ActiveStorage ###
    image1_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image1_filename']))
    image2_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image2_filename']))
    imageDemo_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['imageDemo_filename']))
    image1 = { io: image1_path, filename: File.basename(image1_path), content_type: ((File.extname(image1_path) == ".jpg" || File.extname(image1_path) == ".jpeg") ? "image/jpg" : "image/png") }
    image2 = { io: image2_path, filename: File.basename(image2_path), content_type: ((File.extname(image2_path) == ".jpg" || File.extname(image2_path) == ".jpeg") ? "image/jpg" : "image/png") }
    imageDemo = { io: imageDemo_path, filename: File.basename(imageDemo_path), content_type: ((File.extname(imageDemo_path) == ".jpg" || File.extname(imageDemo_path) == ".jpeg") ? "image/jpg" : "image/png") }

    t.images.attach([image1, image2, imageDemo])

    # ### End: ActiveStorage ###
    # puts "\t --- End: Upload associated product images ---\n"

    # Create associated Product object
    Product.create!(
      name: t.name,
      productable_type: t.model_name,
      productable_id: t.id,
      user_id: t.user_id,
      account_id: t.account_id,
      brand_id: t.brand_id,
    )

    find_created_accessory = Accessory.find(t.id)
    create_productable_body_part_item = find_created_accessory.productable_body_part_items.new(productable_type: t.model_name, productable_id: t.id, body_part_id: BodyPart.find_by(name: "Eyes").id)
    create_productable_category_item = find_created_accessory.productable_category_items.new(productable_type: t.model_name, productable_id: t.id, category_id: Category.find_by(name: "Eyewear").id)
    create_productable_subcategory_item = find_created_accessory.productable_subcategory_items.new(productable_type: t.model_name, productable_id: t.id, subcategory_id: Subcategory.find_by(name: "Sunglasses").id)

    create_productable_body_part_item.save!
    create_productable_category_item.save!
    create_productable_subcategory_item.save!

    puts "#{counter} - #{t.name} created!"
  else
    puts "#{counter} - An error occured."
  end

  counter += 1 # Keep track of how many products added and/or left to create (25 objects total)
end


puts "\n\t--- RESULTS ---\t\n"

puts "There are now #{Accessory.count} rows in the accessories table!"

Accessory.reindex
puts "Accessory has been reindexed!"

puts "---------------- End: Accessory ----------------\n"
