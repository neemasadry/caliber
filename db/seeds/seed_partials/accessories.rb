require 'csv'

Accessory.destroy_all

uploader = ProductImageUploader.new(:store)

jade_black_csv_text = File.read(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Crawl-Run)---2020-03-28T163728Z.csv'))
csv = CSV.parse(jade_black_csv_text, headers: true, encoding: "utf-8")
puts "---------------- Begin: Accessory ----------------"
csv.each do |row|
  t = Accessory.new
  t.name = row['name']
  t.brand_id = Brand.find_by(name: "Jade Black").id
  t.description = row['description']
  t.retail_price = row['retail_price']
  t.type_of = row['type_of']
  t.gender = "Male"
  t.materials = row['material']
  t.primary_color = "N/A"
  t.secondary_color = "N/A"
  t.product_url = row['url']
  t.user_id = User.find_by(email: "jzuniga@gmail.com").id

  image1_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image1_filename']))
  image2_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['image2_filename']))
  imageDemo_path = File.open(Rails.root.join('db', 'seeds', 'Jade_Black', 'Mens', 'Jade-Black-(Images-and-Files)---2020-03-28T163728Z', row['imageDemo_filename']))

  t.product_image_data = uploader.upload(image1_path).to_json
  t.product_image_data = uploader.upload(image2_path).to_json
  t.product_image_data = uploader.upload(imageDemo_path).to_json

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
	puts "#{t.name} by #{t.brand} saved.\n\n"
  image1_path.close
  image2_path.close
  imageDemo_path.close
end


#Accessory.find_each(&:save)
#puts "FriendlyID slugs completed!"

puts "\n\t--- RESULTS ---\t\n"

puts "There are now #{Accessory.count} rows in the accessories table!"
Accessory.reindex
puts "Accessory has been reindexed!"
puts "---------------- End: Accessory ----------------\n"

