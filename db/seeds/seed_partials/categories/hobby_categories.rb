

# Source: https://hobbycue.com/hobbies/
hobby_categories_hash = {
  collecting: {
    physical: [
      "Action figures", "Antiquities", "Art", "Books",
      "Cards", "Coins", "Comic books", "Deltiology (postcards)",
      "Elements", "Flags", "Flowers (pressed)", "Insects",
      "Mineral", "Movie and movie memorabilia", "Stamps (Philately)", "Sea glass",
      "Seashells", "Stones", "Toys", "Video games",
      "Vintage cars"
    ],
    record: [
      "Genealogy", "Scrapbooking", "Movies",
      "Music/Audio Records"
    ],
    spotting: [
      "Aircraft spotting", "Amateur astronomy", "Bird watching", "Bus spotting",
      "Dowsing (ground water)", "Foraging", "Geocaching (GPS)", "Ghost hunting",
      "Gongoozling (canals)", "Herping (reptiles)", "Metal detecting", "Microscopy",
      "Mushroom hunting/mycology", "Satellite watching", "Shortwave listening", "Train spotting"
    ]
  },
  making: {
    "Clothing (Making)": [
      "Crocheting", "Cross-stitch", "Embroidery", "Fashion",
      "Jewelry making", "Knitting", "Lacemaking", "Leather crafting",
      "Macrame", "Quilling", "Quilting", "Sewing",
      "Tatting"
    ],
    cooking: [
      "Baking", "Coffee roasting", "Cooking",
      "Home brewing", "Kombucha brewing", "Wine making"
    ],
    garden: [
      "Gardening", "Hydroponics", "Topiary"
    ],
    model: [
      "3D printing", "Blacksmithing", "Candle making", "Carving",
      "Do It Yourself", "Glassblowing", "Lapidary (stones and gems)", "Lego building",
      "Machining", "Metalworking", "Model building", "Origami",
      "Pottery", "Rock balancing", "Taxidermy", "Whittling",
      "Woodworking"
    ],
    utility: [
      "Amateur radio", "Auto audiophilia", "Book restoration", "Computer programming",
      "Electronics", "Gunsmithing", "High-power rocketry", "Home building",
      "Knife making", "Soapmaking", "Vehicle restoration"
    ]
  },
  activity: {
    animal: [
      "Animal fancy", "Beekeeping", "Fishing",
      "Fishkeeping", "Herp keeping", "Horseback riding",
      "Hunting", "Pet", "Whale watching"
    ],
    outdoor: [
      "Backpacking", "BASE jumping", "Camping", "Canyoning",
      "Climbing", "Driving", "Flying", "Hiking",
      "Kayaking", "Mountain biking", "Mountaineering", "Rafting",
      "Rappelling", "Rock climbing", "Sailing", "Scouting",
      "Scuba diving", "Skydiving", "Slacklining", "Tour skating",
      "Zipline"
    ],
    travel: [ "Exploration", "Road Trip", "Sightseeing",
      "Vacation"
    ]
  },
  play: {
    fitness: [
      "Aerobics", "Bodybuilding", "Brazilian jiu-jitsu", "Gymnastics",
      "Jogging", "Judo", "Martial arts", "Powerlifting",
      "Running", "Taekwondo", "Tai chi", "Walking",
      "Weightlifting", "Yoga", "Zumba",
    ],
    games: [
      "Board/tabletop games", "Bridge", "Card games", "Cheerleading",
      "Chess", "Color guard", "Cosplaying", "Crossword",
      "Cryptography", "Debate", "Exhibition drill", "Fantasy sports",
      "Gaming (tabletop games and role-playing games)", "Go", "Kite flying",
      "LARPing", "Laser tag", "Letterboxing", "Mahjong",
      "Marbles", "Model aircraft", "Poker", "Puzzles",
      "Radio-controlled car", "Slot car racing", "Spinning top", "Speedcubing",
      "Stone skipping", "Treasure hunt", "Video gaming", "Yo-yo",
    ],
    sports: [
      "Air sports", "Airsoft", "Archery", "Auto racing",
      "Badminton", "Baseball", "Basketball", "Billiards",
      "Board sports", "Bowling", "Boxing", "Cricket",
      "Curling", "Cycling", "Darts", "Disc golf",
      "Dog sport", "Equestrianism", "Fencing", "Flying disc",
      "Footbag", "Football", "Golfing", "Handball",
      "Hockey", "Hooping", "Ice hockey",
      "Jukskei", "Kabaddi", "Kart racing", "Lacrosse",
      "Motor sports", "Netball", "Orienteering", "Paintball",
      "Parkour", "Polo", "Pool", "Racquetball",
      "Road biking", "Roller derby", "Rowing", "Rugby",
      "Shooting", "Skating", "Skiing", "Soccer",
      "Sport stacking", "Squash", "Surfing", "Swimming",
      "Table tennis", "Tennis", "Triathlon", "Ultimate frisbee",
      "Volleyball", "Water polo", "Water sports",
    ]
  },
  arts: {
    # dance: [
    #   "Ballet", "Ballroom", "Baton twirling", "Belly",
    #   "Break dancing", "Bharatanatyam", "Bollywood", "Cabaret",
    #   "Cha cha", "Contemporary", "Folk", "Free style",
    #   "Hip-Hop", "Jive",
    #   "Kathak", "Kathakali", "Kuchipudi", "Mohiniyattam",
    #   "Latin", "Odissi", "Poi", "Salsa",
    #   "Troupe", "Rock n Roll", "Rhumba", "Waltz"
    # ],
    music: [
      "Alternative", "Bands", "Bass", "Blues",
      "Carnatic", "Classical", "Country",
      "Drums", "Electro", "Flute", "Fusion",
      "Jazz", "Kanjira", "Ghatam", "Guitar",
      "Hindustani", "Metal", "Morsing", "Mridangam",
      "Latin", "Nadaswaram", "Pop", "R&B", "Rap/Hip-Hop",
      "Rock", "Singing", "Saxophone", "Soul",
      "Tabla", "Vocal", "Veena", "Violin"
    ],
    theater: [
      "Acting", "Drama", "Juggling", "Knife throwing",
      "Magic", "Marching band", "Puppetry", "Stage shows",
      "Stand-up comedy"
    ],
    visual: [
      "Calligraphy", "Colouring", "Digital arts", "Drawing",
      "Flower arranging", "Graffiti", "Painting", "Movie making",
      "Photography", "Sand art", "Sculpting", "Sketching"
    ],
    literary: [
    "Astrology", "Creative writing", "Language learning", "Meteorology",
    "Reading", "Videophilia", "Watching television", "Web surfing",
    "Worldbuilding", "Writing"
    ]
  }
}


hobby_categories_hash.each do |category_group_key, category_group_values|

  # Nested hash contains value to create CategoryGroup
  created_category_group = CategoryGroup.create!(
    name: category_group_key
  )

  puts "CategoryGroup: #{created_category_group.name} created"

  category_group_values.each do |category_key, category_values|

    created_category = Category.create!(
      name: category_key.to_s.capitalize,
      category_group_id: created_category_group.id
    )

    puts "\t#{created_category.name} created!"

    category_values.each do |subcategory|
      created_subcategory = Subcategory.create!(
        name: subcategory.to_s.capitalize,
        category_group_id: created_category_group.id,
        category_id: created_category.id
      )

      puts "\t\tSubcategory: #{created_subcategory.name} created!"
    end # category_values.each

  end # category_group_values.each

end # hobby_categories_hash.each
