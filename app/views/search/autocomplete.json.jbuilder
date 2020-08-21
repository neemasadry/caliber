json.products do
  json.accessories do
    json.array!(@accessories) do |accessory|
      json.name accessory.name
      json.brand accessory.brand
      json.type accessory.type
      json.primary_color accessory.primary_color
      json.url accessory_path(accessory)
    end
  end

  json.bottoms do
    json.array!(@bottoms) do |bottom|
      json.name bottom.name
      json.brand bottom.brand
      json.type bottom.type
      json.primary_color bottom.primary_color
      json.url bottom_path(bottom)
    end
  end

  json.cosmetics do
    json.array!(@cosmetics) do |cosmetic|
      json.name cosmetic.name
      json.brand cosmetic.brand
      json.type cosmetic.type
      json.url cosmetic_path(cosmetic)
    end
  end

  json.dresses do
    json.array!(@dresses) do |dress|
      json.name dress.name
      json.brand dress.brand
      json.type dress.type
      json.primary_color dress.primary_color
      json.url dress_path(dress)
    end
  end

  json.fragrances do
    json.array!(@fragrances) do |fragrance|
      json.name fragrance.name
      json.brand fragrance.brand
      json.url fragrance_path(fragrance)
    end
  end

  json.shoes do
    json.array!(@shoes) do |shoe|
      json.name shoe.name
      json.brand shoe.brand
      json.type shoe.type
      json.primary_color shoe.primary_color
      json.url shoe_path(shoe)
    end
  end

  json.tops do
    json.array!(@tops) do |top|
      json.name top.name
      json.brand top.brand
      json.type top.type
      json.primary_color top.primary_color
      json.url top_path(top)
    end
  end
end # hash of :products

json.guides do
  json.array!(@guides) do |guide|
    json.title guide.title
    json.url guide_path(guide)
  end
end # hash of :guides

json.users do
  json.array!(@users) do |user|
    json.username user.username
  end
end # hash of :users
