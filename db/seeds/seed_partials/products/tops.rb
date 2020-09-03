### TOPS BEGIN ###
# CREATE IMAGE UPLOADER
# uploader_top = ImageUploader.new(:store)

# ESNTLS BLACK TEE
# file_esntls_black_tee = File.new(Rails.root.join('app/assets/images/Esntls_Black_Tee.png'))
# uploaded_file_esntls_black_tee = uploader_top.upload(file_esntls_black_tee)

Top.delete_all

product_images_path = "seeds/product_images/"

esntls_black_tee_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Esntls_Black_Tee.png')), filename: "Esntls_Black_Tee.png", content_type: "image/png"}
Top.create!(name: "Black Tee",
	brand: "ESNTLS",
	#image_data: uploaded_file_esntls_black_tee.to_json,
	description: "With a bamboo and cotton blend our t-shirts are the most versatile T's in the market. The bamboo is a natural antibacterial fabric that fights odors and keeps you refreshed all day. They feature a perfect fit straight out of the bag. You can dress it up to go out in town or dress it down to go to the gym, the thick 320g fabrics is a durable blend that will work with you",
	retail_price: 30.00,
	type_of: "Tee",
	gender: "male",
	material: "65% Bamboo, 28% Cotton, 7% Spandex",
	primary_color: "Black",
	secondary_color: "N/A",
	user_id: 7).product_images.attach(esntls_black_tee_blob_one)

# file_esntls_sky_blue_hoodie = File.new(Rails.root.join('app/assets/images/Esntls_Sky_Blue_Hoodie.png'))
# uploaded_file_esntls_sky_blue_hoodie = uploader_top.upload(file_esntls_sky_blue_hoodie)
esntls_skyblue_hoodie_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Esntls_Sky_Blue_Hoodie.png')), filename: "Esntls_Sky_Blue_Hoodie.png", content_type: "image/png"}
Top.create!(name: "Sky Blue Hoodie",
	brand: "ESNTLS",
	#image_data: uploaded_file_esntls_sky_blue_hoodie.to_json,
	description: "The ESNTL hoodie is a modern take of the classic design. It is no longer baggy and oversized. It is tailored to fit perfectly like everything else in our ESNTLS clothing. We removed excessive frill and made a sleek silhouette so it can become one of the most versatile pieces.",
	retail_price: 60.00,
	type_of: "Hoodie",
	gender: "male",
	material: "100% Cotton",
	primary_color: "Sky Blue",
	secondary_color: "N/A",
	user_id: 7).product_images.attach(esntls_skyblue_hoodie_blob_one)
### TOPS END ###


puts "There are now #{Top.count} rows in the tops table."
Top.reindex
puts "Reindexed: Top"
