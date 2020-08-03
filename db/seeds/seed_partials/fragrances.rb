### FRAGRANCES BEGIN ###
# CREATE IMAGE UPLOADER :fragrance_image [https://stackoverflow.com/questions/47261207/how-do-you-seed-images-using-shrine]
#uploader_fragrance = ImageUploader.new(:store)


# DIOR SAUVAGE
# file_sauvage = File.new(Rails.root.join('app/assets/images/Dior_Sauvage.jpg'))
# uploaded_file_sauvage = uploader_fragrance.upload(file_sauvage)

Fragrance.delete_all
images_path = "seeds/product_images/"

sauvage_blob_one = {io: File.open(Rails.root.join(images_path, 'Dior_Sauvage.jpg')), filename: "Dior_Sauvage.jpg", content_type: "image/jpg"}
sauvage_blob_two = {io: File.open(Rails.root.join(images_path, 'Dior_Sauvage_Box.png')), filename: "Dior_Sauvage_Box.png", content_type: "image/png"}
Fragrance.create!(name: "Sauvage",
	brand: "Dior",
	#image_data: uploaded_file_sauvage.to_json,
	description: "Sauvage is a creation inspired by wide-open spaces. A blue sky that dominates a white-hot rocky landscape. A bold composition for a man that's authentic. To create Sauvage, I used the concept of man as my starting point. A strong and unmistakable masculinity. Like the image of a man who transcends time and fashion. François Demachy, Dior Perfumer-Creator",
	release_date: "2015-09-02",
	retail_price: 77.00,
	gender: "male",
	ingredients: "#09406/A ALCOHOL ● PARFUM (FRAGRANCE) ● AQUA (WATER) ● LIMONENE ● LINALOOL ● ETHYLHEXYL METHOXYCINNAMATE ● CITRONELLOL ● BUTYL METHOXYDIBENZOYLMETHANE ● ETHYLHEXYL SALICYLATE ● COUMARIN ● DIETHYLAMINO HYDROXYBENZOYL HEXYL BENZOATE ● BHT ● CITRAL ● GERANIOL ● CI 60730 (EXT.VIOLET 2) ● CI 14700 (RED 4) ● CI 19140 (YELLOW 5) ● CI 42090 (BLUE 1) ● TOCOPHEROL",
	top_notes: "Pepper, Bergamont",
	middle_notes: "Geranium, Lavender, Patchouli, Pink Pepper, Sichuan Pepper, Elemi, Vetiver",
	base_notes: "Ambroxan, Cedar, Labdanum",
	accords: "N/A",
	user_id: 1).product_images.attach([sauvage_blob_one, sauvage_blob_two])


aventus_blob_one = {io: File.open(Rails.root.join(images_path, 'Creed_Aventus.jpeg')), filename: "Creed_Aventus.jpeg", content_type: "image/jpg"}
# CREED AVENTUS
# file_aventus = File.new(Rails.root.join('app/assets/images/Creed_Aventus.jpeg'))
# uploaded_file_aventus = uploader_fragrance.upload(file_aventus)
Fragrance.create!(name: "Aventus",
	brand: "Creed",
	#image_data: uploaded_file_aventus.to_json,
	description: "The exceptional Aventus was inspired by the dramatic life of a historic emperor, celebrating strength, power and success. Introduced in 2010 and crafted by the deft hand of Sixth Generation Master Perfumer Olivier Creed in collaboration with his son Erwin, this scent has grown to become the best-selling fragrance in the history of the brand. Olivier created its iconic name derived from a (\"from\") ventus (\"the wind\"), illustrating the Aventus man as destined to live a driven life, ever galloping with the wind at his back toward success. Aventus is a sophisticated blend for individuals who savor a life well-lived. ",
	release_date: "2010-09-01",
	retail_price: 435.00,
	gender: "male",
	ingredients: "N/A",
	top_notes: "Bergamot blackcurrant leaves apple pineapple",
	middle_notes: "Pinkberries birch patchouli jasmine",
	base_notes: "Musk oakmoss ambergris vanilla",
	accords: "N/A",
	user_id: 2).product_images.attach([aventus_blob_one])


chanel_bleu_blob_one = {io: File.open(Rails.root.join(images_path, 'Bleu_de_Chanel.jpg')), filename: "Bleu_de_Chanel.jpg", content_type: "image/jpg"}
# BLEU DE CHANEL
# file_chanel_bleu = File.new(Rails.root.join('app/assets/images/Bleu_de_Chanel.jpg'))
# uploaded_file_chanel_bleu = uploader_fragrance.upload(file_chanel_bleu)
Fragrance.create!(name: "Bleu de Chanel",
	brand: "Chanel",
	#image_data: uploaded_file_chanel_bleu.to_json,
	description: "PRODUCT\nA woody, aromatic fragrance for the man who defies convention; a provocative blend of citrus and woods that liberates the senses. Fresh, clean and profoundly sensual.\nComposition\nBLEU DE CHANEL unites the invigorating zest of Grapefruit and the power of an aromatic accord with the woody whisper of Dry Cedar. New Caledonian Sandalwood lends it a warm and sensual trail. A meeting of strength and elegance.\nART OF PERFUMING\nThe Eau de Toilette comes in a spray for easy application.",
	release_date: "2010-06-01",
	retail_price: 97.00,
	gender: "male",
	ingredients: "Nunc quis metus mi. Curabitur porttitor at eros vel dignissim. Sed mattis nisi in posuere vulputate. Aenean eget nunc finibus, euismod leo id, porttitor felis. Curabitur tincidunt pellentesque nisl at faucibus. Duis sollicitudin vestibulum mattis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas ut lectus at diam consectetur rutrum eget eu arcu. Sed a risus nec dui porta consectetur id ut purus. Quisque in est odio. Duis consequat nec justo sed venenatis. Donec placerat odio sit amet ligula maximus gravida. Aenean vitae tortor lobortis, ultrices ante nec, fringilla urna. Quisque scelerisque pretium lectus et viverra. Cras sodales est in mattis interdum. Ut rhoncus luctus luctus. ",
	top_notes: "Grapefruit, Lemon, Ginger, Mint, Pink Pepper",
	middle_notes: "Jasmine, Patchouli, Vetiver",
	base_notes: "Sandalwood​",
	accords: "N/A",
	user_id: 1).product_images.attach([chanel_bleu_blob_one])


jadore_blob_one = {io: File.open(Rails.root.join(images_path, 'Dior_Jadore.jpg')), filename: "Dior_Jadore.jpg", content_type: "image/jpg"}
# DIOR J'ADORE
# file_jadore = File.new(Rails.root.join('app/assets/images/Dior_Jadore.jpg'))
# uploaded_file_jadore = uploader_fragrance.upload(file_jadore)
Fragrance.create!(
	name: "J'adore",
	brand: "Dior",
	#image_data: uploaded_file_jadore.to_json,
	description: "J’adore Eau de Parfum is the iconic women's floral fragrance by Dior. A bouquet finely crafted down to the last detail, like a custom-made flower. Essence of Ylang-Ylang with its floral-fruity notes and essence of Damascus Rose from Turkey blend with a rare duo of Jasmine Grandiflorum from Grasse and Indian Sambac Jasmine with fruity and voluptuous sensuality.\n\n \"J’adore is an extraordinary fragrance, because it succeeds in being effortlessly seductive while boasting an original signature.\n\nCarnal, but not overbearing. This is a composition that unites contrasts, transforming iconic floral notes into an appealing, unprecedented and mysterious ensemble. J'adore invents a flower that does not exist.\" \n\nFrançois Demachy, Dior Perfumer-Creator\n\nThe J'adore bottle is as feminine as its fragrance. Taking up the sensual curves of the legendary amphora created by Christian Dior, it is adorned with the famous Maasai necklace, like a jewel dancing on a woman's neck.",
	release_date: "2015-09-02",
	retail_price: 135.00,
	gender: "female",
	ingredients: "#11057/A ALCOHOL ● PARFUM (FRAGRANCE) ● AQUA (WATER) ● BUTYLPHENYL METHYLPROPIONAL ● BENZYL SALICYLATE ● HEXYL CINNAMAL ● HYDROXYCITRONELLAL ● CITRONELLOL ● ETHYLHEXYL METHOXYCINNAMATE ● ALPHA-ISOMETHYL IONONE ● LIMONENE ● LINALOOL ● BUTYL METHOXYDIBENZOYLMETHANE ● ETHYLHEXYL SALICYLATE ● GERANIOL ● BHT ● BENZYL BENZOATE ● CITRAL ● CINNAMYL ALCOHOL ● BENZYL CINNAMATE ● BENZYL ALCOHOL ● FARNESOL ● TOCOPHEROL ● CI 14700 (RED 4) ● CI 19140 (YELLOW 5) ● CI 60730 (EXT. VIOLET 2)",
	top_notes: "Citrus, Mandarin Orange, Neroli",
	middle_notes: "Jasmine, African Orange Flower, Ylang-Ylang, Rose",
	base_notes: "Wood, Vanilla",
	accords: "N/A",
	user_id: 4).product_images.attach([jadore_blob_one])


beautiful_blob_one = {io: File.open(Rails.root.join(images_path, 'EL_Beautiful.jpg')), filename: "EL_Beautiful.jpg", content_type: "image/jpg"}
# ESTEE LAUDER BEAUTIFUL
# file_beautiful = File.new(Rails.root.join('app/assets/images/EL_Beautiful.jpg'))
# uploaded_file_beautiful = uploader_fragrance.upload(file_beautiful)
Fragrance.create!(
	name: "Beautiful",
	brand: "Estee Lauder",
	#image_data: uploaded_file_beautiful.to_json,
	description: "The fragrance of a thousand flowers.\nA rich blend of Rose, Lily, Tuberose and Orange Flower. Brightened with citrus, warmed by woods.\nRomantic, feminine, memorable.",
	release_date: "2015-09-02",
	retail_price: 135.00,
	gender: "female",
	ingredients: "Alcohol Denat.,Beautiful Perfume (Parfum),Water\\Aqua\\Eau ,Triethyl Citrate, Butyl Methoxydibenzoylmethane, Ethylhexyl Methoxycinnamate, Ethylhexyl Salicylate, Alpha-Isomethyl Ionone, Butylphenyl Methylpropional, Hydroxycitronellal, Evernia Prunastri (Oakmoss) Extract, Hexyl Cinnamal, Eugenol, Linalool, Benzyl Benzoate, Citronellol, Geraniol, Benzyl Salicylate, Limonene, Farnesol, Coumarin, Isoeugenol, Cinnamyl Alcohol, Benzyl Alcohol, Cinnamal, Amyl Cinnamal, Citral, Yellow 5 (Ci 19140), Blue 1 (Ci 42090), Red 17 (Ci 26100)",
	top_notes: "Rose, Mandarin, Lily, Tuberose, Marigold",
	middle_notes: "Orange Flower, Muguet, Jasmine, Ylang-Ylang",
	base_notes: "Sandalwood, Vetiver, Amber",
	accords: "N/A",
	user_id: 6).product_images.attach([beautiful_blob_one])


rebel_blob_one = {io: File.open(Rails.root.join(images_path, 'P&P_Rebel.jpg')), filename: "P&P_Rebel.jpg", content_type: "image/jpg"}
# PETE & PEDRO REBEL
# file_pp_rebel = File.new(Rails.root.join('app/assets/images/P&P_Rebel.jpg'))
# uploaded_file_pp_rebel = uploader_fragrance.upload(file_pp_rebel)
Fragrance.create!(
	name: "Rebel",
	brand: "Pete & Pedro",
	#image_data: uploaded_file_pp_rebel.to_json,
	description: "REBEL By Pete & Pedro is Sexy. Spicy. Seductive!\nRebel is more than just a scent, it's a statement. Be bold. Be confident. Be you.\nInspired by the amazing (and pricey) Creed Aventus scent, we created our own unique fragrance but at a price that won't break your piggy bank. Starting with an infatuating citrus blend that is as daring as it is delightful, Rebel quickly entertains, and then suddenly, seductively, turns warm and mysterious. Lasting notes of woods, musk, and spice leave their mark inspiring you to seize the day and conquer the night. Be amazing gentleman, be a Rebel.\nRebel is an Eau de Parfum making it the highest concentration of fragrance... meaning we went all out! The higher the concentration the more intensely noticeable the fragrance will be (without being obnoxious as REBEL is subtly powerful) and the longer it will last. That doesn't mean it will last forever folks, but you'll get a solid generally 4-6 hours from most EDPs.",
	release_date: "2017-02-15",
	retail_price: 62.00,
	gender: "male",
	ingredients: "Alcohol Denat. Fragrance (Parfum). Water (Aqua)",
	top_notes: "Bergamot Citrus, Pineapple Fruit, Nutmeg Spice",
	middle_notes: "Cassis Fruit, Thyme & Sage Herbals",
	base_notes: "Mossy, Woody Amber & Patchouli",
	accords: "N/A",
	user_id: 5).product_images.attach([rebel_blob_one])


ckAll_blob_one = {io: File.open(Rails.root.join(images_path, 'CK_All.jpg')), filename: "CK_All.jpg", content_type: "image/jpg"}
# CALVIN KLEIN ALL
# file_ck_all = File.new(Rails.root.join('app/assets/images/CK_All.jpg'))
# uploaded_file_ck_all = uploader_fragrance.upload(file_ck_all)
Fragrance.create!(
	name: "All",
	brand: "Calvin Klein",
	#image_data: uploaded_file_ck_all.to_json,
	description: "ck all is bold, inclusive and expressive. An invitation to defy conformity and limitations, designed to be worn by all. A universally appealing clean scent that offers an olfactive blank canvas to celebrate the individual while acting as a form of self-expression and rebellion. \nMaintaining the original citrusy green tea signature, ck all is enhanced through paradisone and the warm embrace of ambrox and hivernal. An echo of the iconic flask-shaped bottle made over in bright white to communicate the clean, universal appeal of ck all. Still a fresh, modern expression of a classic.",
	release_date: "2017-02-15",
	retail_price: 62.00,
	gender: "unisex",
	ingredients: "N/A",
	top_notes: "Citrusy Green Tea",
	middle_notes: "Paradisone",
	base_notes: "Ambrox, Hivernal",
	accords: "N/A",
	user_id: 2).product_images.attach([ckAll_blob_one])
### FRAGRANCES END ###

puts "There are now #{Fragrance.count} rows in the fragrances table."
Fragrance.reindex
puts "Reindexed: Fragrance"
