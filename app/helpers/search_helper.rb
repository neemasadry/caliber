module SearchHelper

  def search_results_nav_tab_options(icons = false)
    if icons == true
      {
        "Accessories": "fal fa-glasses fa-lg",
        "Bottoms": "fal fa-bags-shopping fa-lg",
        "Cosmetics": "fal fa-soap fa-lg",
        "Dresses": "fal fa-bags-shopping fa-lg",
        "Fragrances": "fal fa-spray-can fa-lg",
        "Jewelries": "fal fa-gem fa-lg",
        "Shoes": "fal fa-boot fa-lg",
        "Tops": "fal fa-tshirt fa-lg",
      }
    else
      ["Accessories", "Bottoms", "Cosmetics", "Dresses", "Fragrances", "Jewelries", "Shoes", "Tops"]
    end
  end

  def autocomplete_results_format(autocomplete_hash)
    autocomplete_hash.each do |category_key, category_value|

      if category_key == :products

        category_value.each do |product_category_key, product_category_value|
          if !product_category_value.blank?
            content_tag :h5 do
              "#{product_category_key.to_s.capitalize}"
            end

            product_category_value.each do
               content_tag :li, role: :option do
                 link_to polymorphic_path(product_category_value), data: { "autocomplete-value": product_category_value.id } do
                  image_tag(product_category_value.images.first, size: "75x75")
                  product_category_value.name
                  product_category_value.brand.name
                end
              end
            end
          end # if !product_category_value.blank?
        end # cateogry_value.each

      elsif category_key == :guides

      elsif category_key == :users

      end

    end
  end

end
