module CollectionsHelper

  # product_type_array is an array of the singular form of the product model
  # ex. ["Accessory", "Bottom", "Cosmetic", ...]
  def show_available_options(user)
    product_model_options_with_values = [ ["Accessories", "Accessory"], ["Bottoms", "Bottom"], ["Cosmetics", "Cosmetic"], ["Dresses", "Dress"], ["Fragrances", "Fragrance"], ["Jewelries", "Jewelry"], ["Shoes", "Shoe"], ["Tops", "Top"] ]
    available_collection_types = []

    product_model_options_with_values.each do |option_array|
      second_input = option_array[1]

      user.collections.each do |collection|
        if collection.collection_type == second_input
          next
        else
          available_collection_types << option_array
        end
      end # user.collections.each

    end # product_model_singular.each

    return available_collection_types

  end # def show_available_options(user, product_type_array)

end #module CollectionsHelper
