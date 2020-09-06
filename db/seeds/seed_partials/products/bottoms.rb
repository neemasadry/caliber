### BOTTOMS BEGIN ###
# CREATE IMAGE UPLOADER
# uploader_bottom = ImageUploader.new(:store)

# ESNTLS KHAKI CHINOS
# file_esntls_khaki_chinos = File.new(Rails.root.join('app/assets/images/Esntls_Khaki_Chinos.png'))
# uploaded_file_esntls_khaki_chinos = uploader_bottom.upload(file_esntls_khaki_chinos)

Bottom.delete_all

product_images_path = "db/seeds/product_images/"
user_esntls = User.find_by(username: "josezuniga").id
account_esntls = Account.find_by(name: "ESNTLS").id
brand_esntls = Brand.find_by(name: "ESNTLS").id
#recipe_image_path = {io: File.open(Rails.root.join("/Users/neema/Dropbox/Caliber/seed_images/food_images", recipe_image)), filename: recipe_image, content_type: "image/jpg"}

chinos_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Esntls_Khaki_Chinos.png')), filename: "Esntls_Khaki_Chinos.png", content_type: "image/png"}
khaki_chinos_esntls = Bottom.new(
	name: "Khaki Chinos",
	brand_id: brand_esntls,
	#image_data: uploaded_file_esntls_khaki_chinos.to_json,
	description: "The ESNTL Chino is designed for comfort and style. Use them anywhere and still look stylish. For almost any occasion outside of the boardroom, the ESNTL Chino should meet any dress code. A more stylish alternative to sweatpants, a more comfortable alternative to jeans.",
	retail_price: 60.00,
	#type_of: "Chinos",
	gender: "male",
	materials: "97% Cotton. 3% Spandex",
	primary_color: "Beige",
	secondary_color: "N/A",
	user_id: user_esntls,
	account_id: account_esntls
)

if khaki_chinos_esntls.save!
	khaki_chinos_esntls.images.attach(chinos_blob_one)
	puts "\tImages attached for #{khaki_chinos_esntls.name}!"

	khaki_chinos_esntls.productable_body_part_items.create!(productable_type: khaki_chinos_esntls.model_name, productable_id: khaki_chinos_esntls.id, body_part_id: BodyPart.find_by(name: "Full Length (Legs)").id)
	khaki_chinos_esntls.productable_category_items.create!(productable_type: khaki_chinos_esntls.model_name, productable_id: khaki_chinos_esntls.id, category_id: Category.find_by(name: "Bottom (men)").id)
	khaki_chinos_esntls.productable_subcategory_items.create!(productable_type: khaki_chinos_esntls.model_name, productable_id: khaki_chinos_esntls.id, subcategory_id: Subcategory.find_by(name: "Chinos").id)
else
	puts "\tError occured: #{khaki_chinos_esntls.name}!"
end




# ESNTLS WOLF SWEAT PANTS
# file_esntls_wolf_sweat_pants = File.new(Rails.root.join('app/assets/images/Esntls_Wolf_Sweat_Pants.png'))
# uploaded_file_esntls_wolf_sweat_pants = uploader_bottom.upload(file_esntls_wolf_sweat_pants)

wolf_sweats_blob_one = {io: File.open(Rails.root.join(product_images_path, 'Esntls_Wolf_Sweat_Pants.png')), filename: "Esntls_Wolf_Sweat_Pants.png", content_type: "image/png"}
wolf_sweats_esntls = Bottom.new(
	name: "Wolf Seat Pants",
	brand_id: brand_esntls,
	#image_data: uploaded_file_esntls_wolf_sweat_pants.to_json,
	description: "The ESNTL Sweat Pant is refined comfort at its finest in these pure, premium sweatpants. Tailored to a slim fit, each pair features rear pockets, a functioning button fly, and a drawstring closure. Our specialized knitter sources this ultra-fine material. *Please size down one size for a better fit.",
	retail_price: 60.00,
	#type_of: "Sweat Pants",
	gender: "male",
	materials: "80% Cotton. 20% Polyester",
	primary_color: "Gray",
	secondary_color: "N/A",
	user_id: user_esntls,
	account_id: account_esntls
)
### BOTTOMS END ###

if wolf_sweats_esntls.save!
	wolf_sweats_esntls.images.attach(wolf_sweats_blob_one)
	puts "\tImages attached for #{wolf_sweats_esntls.name}!"

	wolf_sweats_esntls.productable_body_part_items.create!(productable_type: wolf_sweats_esntls.model_name, productable_id: wolf_sweats_esntls.id, body_part_id: BodyPart.find_by(name: "Full Length (Legs)").id)
	wolf_sweats_esntls.productable_category_items.create!(productable_type: wolf_sweats_esntls.model_name, productable_id: wolf_sweats_esntls.id, category_id: Category.find_by(name: "Bottom (men)").id)
	wolf_sweats_esntls.productable_subcategory_items.create!(productable_type: wolf_sweats_esntls.model_name, productable_id: wolf_sweats_esntls.id, subcategory_id: Subcategory.find_by(name: "Sweat pants").id)
else
	puts "\tError occured: #{wolf_sweats_esntls.name}!"
end

puts "There are now #{Bottom.count} rows in the bottoms table."
Bottom.reindex
puts "Reindexed: Bottom"
