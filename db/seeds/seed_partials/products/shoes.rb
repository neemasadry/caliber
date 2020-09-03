### SHOES BEGIN ###
# CREATE IMAGE UPLOADER
# uploader_shoe = ImageUploader.new(:store)

# NIKE AIR PEGASUS 36
# file_nike_pegasus_shoe = File.new(Rails.root.join('app/assets/images/Nike_Air_Zoom_Pegasus_36.jpg'))
# uploaded_file_nike_pegasus_shoe = uploader_shoe.upload(file_nike_pegasus_shoe)

Shoe.delete_all

product_images_path = "seeds/product_images/"

pegasus_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Nike_Air_Zoom_Pegasus_36.jpg')), filename: "Nike_Air_Zoom_Pegasus_36.jpg", content_type: "image/jpg"}
Shoe.create!(name: "Nike Air Pegasus 36",
	brand: "Nike",
	#image_data: uploaded_file_nike_pegasus_shoe.to_json,
	description: "From the indoor track at the gym to the sidewalks around the neighborhood, the Nike® Air Zoom Pegasus 36 running shoes will take your further than ever before.",
	retail_price: 120.00,
	type_of: "Athletic",
	gender: "male",
	material: "N/A",
	primary_color: "Black",
	secondary_color: "White",
	user_id: 1).product_images.attach(pegasus_blob_one)

# BRUNO MAGLI ANCONA
# file_magli_ancona_shoe = File.new(Rails.root.join('app/assets/images/Bruno_Magli_Ancona.jpg'))
# uploaded_file_magli_ancona_shoe = uploader_shoe.upload(file_magli_ancona_shoe)
bruno_magli_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Bruno_Magli_Ancona.jpg')), filename: "Bruno_Magli_Ancona.jpg", content_type: "image/jpg"}
Shoe.create!(name: "Ancona",
	brand: "Bruno Magli",
	#image_data: uploaded_file_magli_ancona_shoe.to_json,
	description: "Sharpen up your look with the Bruno Magli® Ancona oxford featuring an elongated cap toe, brogue details, and a leather upper.\nMade in Italy.",
	retail_price: 395.00,
	type_of: "Oxford",
	gender: "male",
	material: "Leather",
	primary_color: "Dark Brown",
	secondary_color: "N/A",
	user_id: 5).product_images.attach(bruno_magli_blob_one)

# ADIDAS GAMECOURT
# file_adidas_gamecourt_shoe = File.new(Rails.root.join('app/assets/images/Adidas_GameCourt.jpg'))
# uploaded_file_adidas_gamecourt_shoe = uploader_shoe.upload(file_adidas_gamecourt_shoe)
adidas_gamecourt_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Adidas_GameCourt.jpg')), filename: "Adidas_GameCourt.jpg", content_type: "image/jpg"}
Shoe.create!(name: "GameCourt",
	brand: "Adidas",
	#image_data: uploaded_file_adidas_gamecourt_shoe.to_json,
	description: "Go for the win with these Adidas® GameCourt tennis shoes.\nFlexible Adiwear™ rubber outsole offers grip and stability on hard and indoor tennis court surfaces.\nLightweight textile uppers designed with synthetic overlays ensure supreme breathability.\nClassic round toe.\nLace-up closure.\nSoft padded collar.",
	retail_price: 65.00,
	type_of: "Athletic",
	gender: "female",
	material: "N/A",
	primary_color: "White",
	secondary_color: "N/A",
	user_id: 6).product_images.attach(adidas_gamecourt_blob_one)

# NINE WEST TATIANA PUMP
# file_ninewest_tatiana_shoe = File.new(Rails.root.join('app/assets/images/Nine_West_Tatiana_Pump.jpg'))
#uploaded_file_ninewest_tatiana_shoe = uploader_shoe.upload(file_ninewest_tatiana_shoe)
nine_west_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Nine_West_Tatiana_Pump.jpg')), filename: "Nine_West_Tatiana_Pump.jpg", content_type: "image/jpg"}
Shoe.create!(name: "Tatiana Pump",
	brand: "Nine West",
	#image_data: uploaded_file_ninewest_tatiana_shoe.to_json,
	description: "The posh Nine West® Tatiana pumps are sure to get you noticed in all the right ways!\nEasy slip-on wear.\nAvailable in a variety of uppers.\nPointed toe.",
	retail_price: 79.00,
	type_of: "Heels",
	gender: "female",
	material: "N/A",
	primary_color: "Light Pink",
	secondary_color: "Pink",
	user_id: 4).product_images.attach(nine_west_blob_one)
### SHOES END ###

puts "There are now #{Shoe.count} rows in the shoes table."
Shoe.reindex
puts "Reindexed: Shoe"

