


product_categories_hash = {
  # Skip next level for categorization as it's already accessible via productable_type
  accessory: {
    eyewear: ["Eyeglasses", "Sunglasses", "Contact Lenses", "Goggles", "Spectacles", "Safety"],
    earwear: ["Earrings", "Muffs"],
    "Head and Neck": ["Hats", "Bonnets", "Ties", "Cravats", "Scarves", "Shawls", "Lanyards"],
    wrist: ["Watches"],
    hands: ["Gloves"],
    handheld: ["Handbags", "Umbrella", "Fans"]
  },
  bottom: {
    "Bottom (Women)": [
      "Dress Pants", "Jeans (Women)", "Overalls",
      "Jumpsuits", "Culottes", "Harem Pants",
      "Baggy Pants", "Bell Bottoms", "Leggings",
      "Tights", "Punk Pants", "Stirrup Pants", "Fatigue Trousers",
      "Stovepipe Pants", "Peg-leg Pants", "Toreador Pants", "Eastern Pants",
      "Jodhpur Pants", "Dungarees"
    ],
    "Bottom (Men)": [
      "Jeans (Men)", "Khakis", "Pleated Pants", "Cargo Pants",
      "Chinos", "Flat Front Pants", "Sweat Pants"
    ],
    materials: [
      "Denim", "Blends", "Wool", "Corduroy",
      "Cotton/Polyester Blends"
    ]
  },
  cosmetic: {
    "Face Treatments": [
      "Facial Acne", "Botox (Face)", "Facial", "Microdermabrasion",
      "NuFace", "Peels"
    ],
    "Hair Removal": [
      "Electrolysis", "Hair bleaching", "Laser", "Shaving",
      "Sugaring", "Threading", "Waxing"
    ],
    "Hair": [
      "Styling", "Pre-Styler"
    ],
    "Hair Salon": [
      "Blowouts", "Braids", "Color", "Haircut",
      "Hair extensions", "Highlights / lowlights", "Kids", "Men’s cut",
      "Special occasion", "Hair treatments", "Women’s cuts", "Updo"
    ],
    "Makeup/Lashes/Brows": [
      "Makeup application", "Bridal", "Eyelash extensions", "Latisse",
      "Microblading", "Permanent", "Semi-permanent", "Threading Brows",
      "Trial"
    ],
    "Med Spa": [
      "Acne", "Body contouring", "Botox", "Chemical peel",
      "Dermabrasion / microdermabrasion", "Dermal fillers", "Dermaplaning", "Face lift",
      "Hair removal", "Hair replacement", "Juvederm", "Laser hair removal",
      "Light therapy", "Liposuction", "Microblading (Other)", "Permanent makeup",
      "Rejuvenation", "Scar removal", "Skin tightening", "Sclerotherapy"
    ],
    "Nails": [
      "Acrylic", "Gel", "Manicure", "Pedicure"
    ],
    "Tanning": [
      "Organic", "Spray tan", "Sunless bed"
    ],
    "Tattoo/Piercing": [
      "Body", "Body art", "Consultation",
      "Ear", "Henna", "Removal"
    ],
    "Hygiene": [
      "Shampoo", "Conditioner", "Body Wash", "Soap",
      "Deoderant", "Antiperspirant"
    ],
    "Grooming Tool": [
      "Comb/Brush", "File", "Clipper/Tweezer",
    ],
    "Dental Hygiene": [
      "Toothpaste", "Whitening", "Floss", "Tooth Brush (Manual)",
      "Tooth Brush (Electric)", "Mouth Wash"
    ],
    "Shaving": [
      "Shaving Cream", "Shaving Soap", "Razor",
      "After-Shave", "Pre-Shave Oil", "Blades",
      "Beard Oil", "Other"
    ]

    # hair: ["Styling", "Shampoo", "Conditioning", "Repair", "Growth"],
    # skin: ["Moisturize", "Aging", "Sunscreen", "Body Wash", "Exfoliating", "Oil Control", "Acne Treatment", "Eye Cream"],
    # nails: ["Nail Polish", ""]
  },
  dress: {
    # Source: https://www.thetrendspotter.net/types-of-dresses/
    "Styles (Dress)": [
      "Midi Dress", "Off the Shoulder", "Shift Dress", "Bodycon Dress",
      "A-Line Dress", "Mini Dress", "Maxi Dress", "Wrap Dress",
      "Halter Dress", "High-Low Dress", "Sheath Dress", "Peplum Dress",
      "Sweater Dress", "Pencil Dress",
      "Shirt Dress", "Slip Dress", "Smock Dress", "Ballgown",
      "Mermaid Silhouette Dress", "T-shirt Dress", "Tea Length Dress", "Cocktail Dress",
      "Denim Dress", "Pinafore Dress", "Bardot Dress", "Tube Dress",
      "Qipao Dress", "Long Sleeve Dress", "Bell-Sleeve Dress", "Strapless Dress",
      "Blazer Dress", "Empire Waist Dress", "Sun Dress", "Kimono Dress",
      "One Shoulder Dress", "Handkerchief Hem Dress", "Asymmetrical Dress", "Bandage Dress",
      "Pouf Dress", "Princess Silhouette Dress "
    ]
  },
=begin
  fragrance: {
    "Fragrance Strength": {
      "Parfum": "20-30%",
      "Eau de Parfum": "10-20%",
      "Eau de Toilette": "5-15%",
      "Eau de Cologne": "2-4%",
      "Eau Fraiche": "1-3%"
    },
    "Fragrance Size (fl oz.)": {
      "0.05": 15,
      "0.17": 50,
      "0.5": 150,
      "0.8": 250,
      "1": 300,
      "1.4": 400,
      "1.7": 500,
      "2": 750,
      "2.5": 800,
      "3": 900,
      "3.4": 1000,
      "4.2": 1250,
      "6.7": 2000
    },
    "Fragrance Size (mL)": {
      "1.5": 15,
      "5": 50,
      "15": 150,
      "25": 250,
      "30": 300,
      "40": 400,
      "50": 500,
      "75": 750,
      "80": 800,
      "90": 900,
      "100": 1000,
      "125": 1250,
      "200": 2000,
      "300": 3000,
      "400": 4000,
      "500": 5000,
      "600": 6000,
      "700": 7000,
      "800": 8000,
      "900": 9000,
      "1000": 10000
    },
    wheel: {
      "Oriental Notes": [
        "Soft Oriental",
        "Oriental",
        "Woody Oriental"
      ],
      "Woody Notes": [
        "Woods",
        "Mossy Woods",
        "Dry Woods",
        "Aromatic"
      ],
      "Fresh Notes": [
        "Citrus",
        "Water",
        "Green",
        "Fruity"
      ],
      "Floral Notes": [
        "Floral",
        "Soft Floral",
        "Floral Oriental"
      ]
    }
  },

  jewelry: {
    "Jewelry by Body Part": {
      "Head and Neck (Jewelry Type)": [
        #"Carcanet", #"Sarpech",
        "Tiara", "Earrings", "Ear Cuff", "Fascinator",
        "Hairpin", "Hatpin", "Nose Ring",
        "Bolo Tie", "Circlets", "Choker", "Necklace",
        "Pendant", "Torc"
      ],
      "Arms (Jewelry Type)": [
        "Armlet",
      ],
      "Wrist (Jewelry Type)": [
        "Bangle", "Bracelet", "Friendship Bracelet", "Cuff Links"
      ],
      "Hands (Jewelry Type)": [
        #"Nawarat Ring",
        "Class Ring", "Engagement Ring", "Wedding Ring"
      ],
      "Body (Jewelry Type)": [
        "Belly Chain", "Body Piercing", "Brooch", "Chatelaine", "Tie Clip"
      ],
      "Feet (Jewelry Type)": [
        "Ankle Bracelet", "Toe Ring"
      ]
    }
  },
=end
  shoe: {
    "Styles (Shoes)": [
      "Ballet shoe", "Pointe shoe", "Blucher shoe", "Boat shoe",
      "Brogan (shoes)", "Brogue shoe", "Brothel creeper", "Bucks",
      "Chelsea boot", "Chukka boot", "Climbing shoe", "Clog",
      "d'Orsay Pumps", "Cross country running shoe", "Derby shoe", "Desert Boot",
      "Diabetic shoe", "Dress shoe", "Earth shoe", "Elevator shoes",
      "Espadrille", "Fashion boot", "Galesh", "Geta",
      "Giveh", "High-heeled footwear", "Jazz shoe", "Jelly shoes",
      "Jutti", "Kitten heel", "Kolhapuri Chappal", "Kung fu shoe",
      "Loafers", "Mary Jane", "Moccasin", "Monk shoe",
      "Mule", "Opanak", "Opinga", "Orthopaedic footwear",
      "Over-the-knee boot", "Oxford shoe", "Pampootie",
      "Peep-toe shoe", "Peranakan beaded slippers", "Peshawari chappal", "Platform shoe",
      "Pointed shoe", "Pointinini", "Riding boots", "Rocker bottom shoe",
      "Ruby slippers", "Russian boot", "Saddle shoe", "Sailing boots",
      "Sandal", "Toe Shoe", "Silver Shoes", "Slingback",
      "Slip-on shoe", "Slipper", "Sneakers", "Snow boot",
      "Spectator shoe", "Spool heel", "Steel-toe boot", "Stiletto heel",
      "T-bar sandal", "Tiger-head shoes", "Turnshoe",
      "Venetian-style shoe", "Wedge", "Wellington boot", "Winklepicker"
    ]
  },
  suit: {
    "Types (Suit)": [
      "Slim Fit", "Classic Fit", "Modern Fit",
      "Notch Lapel", "Shawel Lapel", "Peak Lapel",
      "Single Breasted", "Double Breasted", "Unstructured Blazer",
      "Patch Pocket Blazer", "Centre Vent Suit", "Side Vent",
      "No Vent", "Cuffed Pants"
      # "Flat Front Pants", "Pleated Pants"
    ]
  },
  top: {
    "Top (Women)": [
      "Asymmetrical top", "Bardot top – Off shoulder top", "Batwing top (Magyar/ Dolman)", "Bralette top",
      "Boxy top", "Blouson top", "Body suit top", "Bustier top",
      "Camisole top", "Cape top", "Cardigans & Sweaters ", "Crop top",
      "Choker top", "Corset top", "Collar top", "Cold-shouldered top",
      "Draped blouse", "Empire line top", "Flashdance top", "Halter top ",
      "Henley neck top", "High Low top", "Kaftan top", "Keyhole top",
      "Lace up top", "Layered top", "Maxi Top", "One shoulder top",
      "Peasant top", "Poncho", "Peplum Top", "Princess line top", "Raglan sleeve top", "Spaghetti strap top",
      "Sweatshirt", "Swing top", "Shirt ", "Smock top",
      "Shell top", "Tie front tops", "Tank top", "Tube top",
      "Tunic top", "T-shirt", "Wrap top / Surplice top", "X-ray top",
      "Yoke top"
    ],
    "Top (Men)": [
      "Oxford Button-Down Shirt", "Dress Shirt", "Cuban Collar Shirt",
      "Overshirt", "Flannel Shirt", "Office Shirt",
      "Chambray", "Classic Short Sleeve Shirt", "Denim Shirt",
      "Linen Shirt", "Polo Shirt",
    ]
  }
}


created_category_group = CategoryGroup.create!(
  name: "Product"
)

puts "#{created_category_group.name} created!\n"

product_categories_hash.each do |product_type, product_values|
  if product_type != :fragrance || product_type != :jewelry

    product_values.each do |category_key, category_values|

      created_category = Category.create!(
        name: category_key.to_s.capitalize,
        category_group_id: created_category_group.id
      )

      puts "\t#{created_category.name} created!\n"

      category_values.each do |subcategory|
        created_subcategory = Subcategory.create!(
          name: subcategory.to_s.capitalize,
          category_group_id: created_category_group.id,
          category_id: created_category.id
        )

        puts "\t\t#{created_subcategory.name} created!\n"
      end # category_values.each
    end # product_values.each

  else
    # Run for :fragrance or :jewelry for within their hash is another hash (ie not an array, like the others)

    product_values.each do |category_key, category_values|

      if category_key == :fragrance
        created_category = Category.create!(
          name: category_key.to_s.capitalize,
          category_group_id: created_category_group.id
        )
      elsif category_key == :jewelry
        created_category = Category.create!(
          name: category_key.to_s.capitalize,
          category_group_id: created_category_group.id
        )
      end


      puts "\t#{created_category.name} created!\n"

      category_values.each do |subcategory_key, subcategory_values|
        created_subcategory = Subcategory.create!(
          name: subcategory_value.to_s.capitalize,
          category_group_id: created_category_group.id,
          category_id: created_category.id
        )

        puts "\t\t#{created_subcategory.name} created!\n"
      end # category_values.each
    end # product_values.each

  end # if product_type == :fragrance || product_type == :jewelry
end

