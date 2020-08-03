### BOTTOMS BEGIN ###
# CREATE IMAGE UPLOADER
# uploader_bottom = ImageUploader.new(:store)

# ESNTLS KHAKI CHINOS
# file_esntls_khaki_chinos = File.new(Rails.root.join('app/assets/images/Esntls_Khaki_Chinos.png'))
# uploaded_file_esntls_khaki_chinos = uploader_bottom.upload(file_esntls_khaki_chinos)

Bottom.delete_all

product_images_path = "seeds/product_images/"
#recipe_image_path = {io: File.open(Rails.root.join("/Users/neema/Dropbox/Caliber/seed_images/food_images", recipe_image)), filename: recipe_image, content_type: "image/jpg"}

chinos_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Esntls_Khaki_Chinos.png')), filename: "Esntls_Khaki_Chinos.png", content_type: "image/png"}
Bottom.create!(name: "Khaki Chinos",
	brand: "ESNTLS",
	#image_data: uploaded_file_esntls_khaki_chinos.to_json,
	description: "The ESNTL Chino is designed for comfort and style. Use them anywhere and still look stylish. For almost any occasion outside of the boardroom, the ESNTL Chino should meet any dress code. A more stylish alternative to sweatpants, a more comfortable alternative to jeans.",
	retail_price: 60.00,
	type_of: "Chinos",
	gender: "male",
	material: "97% Cotton. 3% Spandex",
	primary_color: "Beige",
	secondary_color: "N/A",
	user_id: 7).product_images.attach(chinos_blob_one)

# ESNTLS WOLF SWEAT PANTS
# file_esntls_wolf_sweat_pants = File.new(Rails.root.join('app/assets/images/Esntls_Wolf_Sweat_Pants.png'))
# uploaded_file_esntls_wolf_sweat_pants = uploader_bottom.upload(file_esntls_wolf_sweat_pants)

wolf_sweats_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Esntls_Wolf_Sweat_Pants.png')), filename: "Esntls_Wolf_Sweat_Pants.png", content_type: "image/png"}
Bottom.create!(name: "Wolf Seat Pants",
	brand: "ESNTLS",
	#image_data: uploaded_file_esntls_wolf_sweat_pants.to_json,
	description: "The ESNTL Sweat Pant is refined comfort at its finest in these pure, premium sweatpants. Tailored to a slim fit, each pair features rear pockets, a functioning button fly, and a drawstring closure. Our specialized knitter sources this ultra-fine material. *Please size down one size for a better fit.",
	retail_price: 60.00,
	type_of: "Sweat Pants",
	gender: "male",
	material: "80% Cotton. 20% Polyester",
	primary_color: "Gray",
	secondary_color: "N/A",
	user_id: 7).product_images.attach(wolf_sweats_blob_one)
### BOTTOMS END ###

puts "There are now #{Bottom.count} rows in the bottoms table."
Bottom.reindex
puts "Reindexed: Bottom"
