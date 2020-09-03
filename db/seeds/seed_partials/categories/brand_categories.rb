


brand_categories_array = [
  #"App Page",
  "Appliances",
  "Baby Goods/Kids Goods",
  "Bags/Luggage",
  "Beauty/Cosmetics/Hygiene",
  #"Board Game",
  #"Brand",
  #"Building Materials",
  "Camera/Photo",
  "Cars",
  "Clothing",
  #"Commercial Equipment",
  "Computers (Brand)",
  "Electronics",
  "Food & Beverage Company",
  "Furniture",
  #"Games/Toys",
  "Grooming/Hygiene",
  "Health/Nutrition",
  "Home Décor",
  "Household Supplies",
  "Jewelry/Watches",
  "Kitchen/Cooking",
  "Office Supplies",
  "Patio/Garden",
  "Pet Supplies",
  "Pharmaceuticals",
  #"Phone/Tablet",
  "Product/Service",
  #"Software",
  "Tools/Equipment",
  #"Video Game",
  "Vitamins/Supplements",
  #"Website",
  "Wine/Spirits"
]

created_category_group = CategoryGroup.create!(
  name: "Brand"
)

brand_categories_array.each do |brand_category|
  created_brand_category = Category.create!(
    name: brand_category,
    category_group_id: created_category_group.id
  )

  puts "\tCategory: #{created_brand_category.name} created!"
end
