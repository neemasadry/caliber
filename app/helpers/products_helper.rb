module ProductsHelper

  def products_nav_tab_options(select_arr)
    #["products_&_brands", "guides", "profile", "notifications", "social", "settings", "subscription", "chat", "sponsor", "analytics"]
    if select_arr == "nav_only"
      #return ["products_&_brands", "guides", "profile", "notifications", "social", "settings"]
      return {
        "accessories" => "fa-hat-winter",
        "bottoms" => "fa-socks",
        "cosmetics" => "fa-mask",
        "dresses" => "fa-question",
        "fragrances" => "fa-spray-can",
        "jewelries" => "fa-gem",
        "shoes" => "fa-shoe-prints",
        "suits" => "fa-user-tie",
        "tops" => "fa-tshirt"
      }
    elsif select_arr == "render_page_names"
      return ["accessories", "bottoms", "cosmetics", "dresses", "fragrances", "jewelries", "shoes", "suits", "tops"]
    elsif select_arr == "render_page_names_for_select"
      return ["Accessories", "Bottoms", "Cosmetics", "Dresses", "Fragrances", "Jewelries", "Shoes", "Suits", "Tops"]
    end
  end

end
