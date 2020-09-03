


event_categories_hash = {
  # festivals: [

  # ],
  # celebrations: [

  # ],
  # ceremonies: [

  # ],
  holidays: [
    "New Year", "Christmas", "Thanksgiving", "Easter",
    "Independence Day", "Mother's Day", "Father's Day", "Halloween",
    "Valentine's Day", "St. Patrick's Day", "Labor Day", "Memorial Day"
  ],
  meetings: [
    "Seminar", "Conference", "Convention", "Trade Show",
    "Workshop", "Networking", "Exhibition", "Business Dinner"
  ],
  occasions: [
    "First Date", "First Day of School", "Prom", "Wedding",
    "Reunion", "Gala", "Award", "Opening",
    "Baptism/Christening", "Initiation", "Social adulthood", "Graduation",
    "Retirement", "Funeral"
  ],
  public: [
    "Concert/Live Performance", "Speaker", "Press conference",
    "Charity", "Fundraising",
  ]
}

created_category_group = CategoryGroup.create!(
  name: "Event"
)

puts "\tCategoryGroup: #{created_category_group.name} created!"

event_categories_hash.each do |category_type, category_values|

  created_category = Category.create!(
    name: category_type.to_s.capitalize,
    category_group_id: created_category_group.id
  )

  puts "\tCategory: #{created_category.name} created!"

  category_values.each do |subcategory|
    created_subcategory = Subcategory.create!(
      name: subcategory.to_s.capitalize,
      category_group_id: created_category_group.id,
      category_id: created_category.id
    )

    puts "\tSubcategory: #{created_subcategory.name} created!"
  end # category_values.each

end # event_categories_hash.each
