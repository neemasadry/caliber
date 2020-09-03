### COSMETICS BEGIN ###
# CREATE IMAGE UPLOADER
# uploader_cosmetic = ImageUploader.new(:store)

# HOUSE 99 - TRULY BRIGHTER EYE BALM
# file_house99_eye_balm = File.new(Rails.root.join('app/assets/images/House99_Truly_Brighter_Eye_Balm.png'))
# uploaded_file_house99_eye_balm = uploader_cosmetic.upload(file_house99_eye_balm)

Cosmetic.delete_all
images_path = "seeds/product_images/"

house99_blob_one = {io: File.open(Rails.root.join(images_path, 'House99_Truly_Brighter_Eye_Balm.png')), filename: "House99_Truly_Brighter_Eye_Balm.png", content_type: "image/png"}
Cosmetic.create!(name: "Truly Brighter Eye Balm",
	brand: "House 99",
	#image_data: uploaded_file_house99_eye_balm.to_json,
	description: "Look your best even after those nights with minimum rest. Our fast-absorbing Truly Brighter Eye Balm smoothes skin and reduces the appearance of dark circles, crow's feet and even pronounced lines for a brighter look.\n\nDavid Beckham's Inspiration:\nInspired by David Beckham's lifestyle - always on the go. Jumping from plane to plane, and time zone to time zone, this is just the trick to keep that jet-lagged look at bay.",
	retail_price: 26.00,
	type_of: "Skin Care",
	gender: "male",
	ingredients: "AQUA / WATER, GLYCERIN, DIMETHICONE, ALCOHOL DENAT, THEOBROMA CACAO SEED BUTTER / COCOA SEED BUTTER, BUTYROSPERMUM PARKII BUTTER / SHEA BUTTER, POLY C10-30 ALKYL ACRYLATE, HYDROGENATED POLYISOBUTENE, SUCROSE STEARATE, STEARIC ACID, PALMITIC ACID, HYDROXYETHYLPIPERAZINE ETHANE SULFONIC ACID, CHENOPODIUM QUINOA SEED EXTRACT, CITRUS AURANTIUM DULCIS FRUIT WATER / ORANGE FRUIT WATER, TIN OXIDE, SECALE CEREALE SEED EXTRACT / RYE SEED EXTRACT, SACCHARUM OFFICINARUM EXTRACT / SUGAR CANE EXTRACT, VACCINIUM MYRTILLUS FRUIT EXTRACT, GLYCINE SOJA PROTEIN / SOYBEAN PROTEIN, DIMETHICONOL, CAFFEINE, SODIUM CITRATE, SODIUM COCOYL GLUTAMATE, SODIUM HYDROXIDE, SODIUM PHOSPHATE, SODIUM POLYACRYLATE, MYRISTIC ACID, ADENOSINE, ASCORBYL GLUCOSIDE, NYLON-12, HYDROLYZED LINSEED EXTRACT, ACER SACCHARUM EXTRACT / SUGAR MAPLE EXTRACT, SPIRULINA PLATENSIS EXTRACT, CAPRYLYL GLYCOL, VITREOSCILLA FERMENT, CITRIC ACID, CITRUS LIMON FRUIT EXTRACT / LEMON FRUIT EXTRACT, XANTHAN GUM, SYNTHETIC WAX, PENTYLENE GLYCOL, DEXTRIN, ETHYLHEXYLGLYCERIN, ACRYLATES/C10-30 ALKYL ACRYLATE CROSSPOLYMER, TOCOPHEROL, PENTAERYTHRITYL TETRA-DI-T-BUTYL HYDROXYHYDROCINNAMATE, POTASSIUM SORBATE, SODIUM BENZOATE, PHENOXYETHANOL, CHLORPHENESIN.",
	user_id: 2).product_images.attach(house99_blob_one)

### COSMETICS END ###

puts "There are now #{Cosmetic.count} rows in the cosmetics table."
Cosmetic.reindex
puts "Reindexed: Cosmetic"
