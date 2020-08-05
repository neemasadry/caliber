require 'csv'
require 'active_support/core_ext/hash'

Accessory.destroy_all

brand_entry = Brand.find_by(name: "Jade Black")
user_entry = User.find_by(email: "jzuniga@gmail.com")
uploader = ProductImageUploader.new(:store)
counter = 1

jade_black_csv_text = File.read(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Crawl-Run)---2020-03-28T163728Z.csv'))
csv = CSV.parse(jade_black_csv_text, headers: true, encoding: "utf-8")
puts "---------------- Begin: Accessory ----------------"
csv.each do |row|
  t = Accessory.new
  t.name = row['name']
  t.brand_id = brand_entry.id
  t.description = row['description']
  t.retail_price = row['retail_price']
  t.type_of = row['type_of']
  t.gender = "Male"
  t.materials = row['material']
  t.primary_color = "N/A"
  t.secondary_color = "N/A"
  t.product_url = row['url']
  t.user_id = user_entry.id

  # image1_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image1_filename']))
  # image2_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image2_filename']))
  # imageDemo_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['imageDemo_filename']))

  image1_path = { product_image: File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image1_filename'])), user: user_entry, brand: brand_entry }
  image2_path = { product_image: File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image2_filename'])), user: user_entry, brand: brand_entry }
  imageDemo_path = { product_image: File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['imageDemo_filename'])), user: user_entry, brand: brand_entry }

  # product_image1_data = uploader.upload(image1_path).to_json
  # product_image2_data = uploader.upload(image2_path).to_json
  # product_imageDemo_data = uploader.upload(imageDemo_path).to_json

  product_images_attributes_array = [image1_path, image2_path, imageDemo_path]

  t.product_images_attributes = product_images_attributes_array

  # ### Begin: ActiveStorage ###
  # image1_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image1_filename']))
  # image2_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image2_filename']))
  # imageDemo_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['imageDemo_filename']))
  # image1 = { io: image1_path, filename: File.basename(image1_path), content_type: ((File.extname(image1_path) == ".jpg" || File.extname(image1_path) == ".jpeg") ? "image/jpg" : "image/png") }
  # image2 = { io: image2_path, filename: File.basename(image2_path), content_type: ((File.extname(image2_path) == ".jpg" || File.extname(image2_path) == ".jpeg") ? "image/jpg" : "image/png") }
  # imageDemo = { io: imageDemo_path, filename: File.basename(imageDemo_path), content_type: ((File.extname(imageDemo_path) == ".jpg" || File.extname(imageDemo_path) == ".jpeg") ? "image/jpg" : "image/png") }

  # t.images.attach([image1, image2, imageDemo])
  # ### End: ActiveStorage ###

	t.save! # Use bang to return ActiveRecord validation errors
	puts "#{counter} - #{t.name} by Jade Black saved.\n\n"
  # image1_path.close
  # image2_path.close
  # imageDemo_path.close
end


#Accessory.find_each(&:save)
#puts "FriendlyID slugs completed!"

puts "\n\t--- RESULTS ---\t\n"

puts "There are now #{Accessory.count} rows in the accessories table!"
counter += 1
Accessory.reindex
puts "Accessory has been reindexed!"
puts "---------------- End: Accessory ----------------\n"

