# all_products = DiorProduct.all

counter = 1
ScraperBuiltLink.all.each do |sbl|
  DiorBuiltLink.create(
    product_name:     sbl.product_name,
    product_url:      sbl.product_url,
    scraper_brand_id: sbl.scraper_brand_id,
    body_part:        sbl.body_part,
    category:         sbl.category,
    subcategory:      nil
  )
  puts sbl.inspect
  counter += 1
  break if counter == 5
end
