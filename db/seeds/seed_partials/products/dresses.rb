### DRESSES BEGIN ###
# CREATE IMAGE UPLOADER
# uploader_dress = ImageUploader.new(:store)

# BURBERRY
# file_burberry_dress = File.new(Rails.root.join('app/assets/images/Burberry_Tie_Waist_Dress.jpg'))
# uploaded_file_burberry_dress = uploader_dress.upload(file_burberry_dress)

Dress.delete_all
product_images_path = "seeds/product_images/"

burberry_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Burberry_Tie_Waist_Dress.jpg')), filename: "Burberry_Tie_Waist_Dress.jpg", content_type: "image/jpg"}
Dress.create!(name: "Patterend Tie-Waist Dress",
	brand: "Burberry",
	#image_data: uploaded_file_burberry_dress.to_json,
	description: "This beige Burberry Vintage check shirt dress is made with a cotton blend. It features a button-down collar, a chest button placket, self-tie belt, adjustable cropped sleeves with a roll-up button fastening and a curved hem. From Peckham to the Royal Palace, Burberry clothing has endless style mileage. Does that make this shirt dress appropriate for tea and biscuits with Lilibet, then?",
	retail_price: 595.00,
	type_of: "Tie-waist Shirt",
	material: "Cotton 95%. Polyester 100%. Spandex/Elastane 5%.",
	primary_color: "Burberry Pattern",
	secondary_color: "N/A",
	user_id: 5).product_images.attach(burberry_blob_one)

# CHANEL
# file_chanel_dress = File.new(Rails.root.join('app/assets/images/Chanel_Tweed_Dress.jpg'))
# uploaded_file_chanel_dress = uploader_dress.upload(file_chanel_dress)
chanel_tweed_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Chanel_Tweed_Dress.jpg')), filename: "Chanel_Tweed_Dress.jpg", content_type: "image/jpg"}
Dress.create!(name: "Tweed Dress",
	brand: "Chanel",
	#image_data: uploaded_file_chanel_dress.to_json,
	description: "Tweed was and will always be one of the strongest materials chosen by Ms Chanel. Deployed in a grey, black, bordeaux red and light pink silk-wool-cotton blend dress, this choice of garment temporarily replaces the collarless blazer, known for being crafted from the same fabric. Contemporary, this shortsleeved piece has an atypical check pattern on a short length. It's fastened with faux pearl embellished logo buttons on a double row centred on the front. Without pockets, it shows ca slim silhouette, finished with a traditional classic collar. Please note that pre-owned items are not new and therefore might have minor imperfections.\n\nMade in France",
	retail_price: 4750.00,
	type_of: "Cocktail",
	material: "Nylon 43%, Silk 27%, Wool 14%, Rayon 14%, Cotton 2%",
	primary_color: "White",
	secondary_color: "Black",
	user_id: 4).product_images.attach(chanel_tweed_blob_one)

# VERSACE
# file_versace_dress = File.new(Rails.root.join('app/assets/images/Versace_Gold_Brown_Dress.jpg'))
# uploaded_file_versace_dress = uploader_dress.upload(file_versace_dress)
versace_dress_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Versace_Gold_Brown_Dress.jpg')), filename: "Versace_Gold_Brown_Dress.jpg", content_type: "image/jpg"}
Dress.create!(name: "Gold Silk Gown",
	brand: "Versace",
	#image_data: uploaded_file_versace_dress.to_json,
	description: "Mixed Print Silk Gown.\nGold/brown baroque floral-and-crown print on leopard-print chiffon.\nDramatic, sheer balloon sleeves.\nRuffle-trimmed shoulders and crystal embellished embroidery",
	retail_price: 9875.00,
	type_of: "Formal",
	material: "100% Silk",
	primary_color: "Brown",
	secondary_color: "Gold",
	user_id: 5).product_images.attach(versace_dress_blob_one)

### DRESSES END ###

puts "There are now #{Dress.count} rows in the Dresses table."
Dress.reindex
puts "Reindexed: Dress"
