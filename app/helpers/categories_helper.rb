module CategoriesHelper

  def categories_nav_tab_options(select_arr)
    #["products_&_brands", "guides", "profile", "notifications", "social", "settings", "subscription", "chat", "sponsor", "analytics"]
    if select_arr == "nav_only"
      #return ["products_&_brands", "guides", "profile", "notifications", "social", "settings"]
      return {
        "body_part_groups" => "fa-people-arrows",
        "body_parts" => "fa-head-side",
        "category_groups" => "fa-th-list",
        "categories" => "fa-list",
        "subcategories" => "fa-stream"
      }
    elsif select_arr == "render_page_names"
      return ["body_part_groups", "body_parts", "category_groups", "categories", "subcategories"]
    elsif select_arr == "render_page_names_for_select"
      return ["Body Part Groups", "Body Parts", "Category Groups", "Categories", "Subcategories"]
    end
  end

end
