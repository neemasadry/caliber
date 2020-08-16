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

end
