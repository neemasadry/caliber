module OutfitsHelper

  # def outfit_dropdown(outfits, product)

  #   tag.span class: "relative z-0 inline-flex shadow-sm rounded-md" do
  #     button_to(polymorphic_path(product, action: "outfit"), method: :put, class: "relative inline-flex items-center px-4 py-2 rounded-l-md border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150") do
  #       "Add to Collection"
  #     end

  #     tag.span class: "-ml-px relative block" do
  #       tag.div data: { action: "click->dropdown#toggle click@window->dropdown#hide" }, role: "button", class: "inline-block select-none" do
  #         button_tag(class: "relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-400 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-500 transition ease-in-out duration-150", aria: { label: "Expand" }) do
  #           #fa_icon("fal fa-chevron-down")
  #           '<svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
  #             <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
  #           </svg>'.html_safe
  #         end

  #         tag.div data: { target: "dropdown.menu" }, class: "origin-top-right absolute right-0 mt-2 -mr-1 w-56 rounded-md shadow-lg" do
  #           tag.div class: "rounded-md bg-white shadow-xs" do
  #             tag.div class: "py-1" do
  #               outfits.each do |outfit_obj|
  #                 link_to polymorphic_path(product, action: "outfit"), class: "block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 hover:text-gray-900 focus:outline-none focus:bg-gray-100 focus:text-gray-900" do
  #                   outfit_obj.name
  #                 end # link_to
  #               end # outfits.each
  #             end # content_tag :div
  #           end # content_tag :div
  #         end # content_tag :div

  #       end # content_tag :span (INNER)
  #     end
  #   end # Content_tag :span (OUTER)

  # end

  def body_categorization
    {
      Head: ["Crown", "Eyes", "Ears"],
      Neck: ["Neck"],
      "Right Arm": ["Right Arm", "Right Forearm", "Right Wrist", "Right Hand", "Right Thumb", "Right Index Finger", "Right Middle Finger", "Right Ring Finger", "Right Baby Finger"],
      Chest: ["Under", "First Layer", "Second Layer", "Third Layer", "Fourth Layer"],
      "Left Arm": ["Left Arm", "Left Forearm", "Left Wrist", "Left Hand", "Left Thumb", "Left Index Finger", "Left Middle Finger", "Left Ring Finger", "Left Baby Finger"],
      Waist: ["Belt", "Accessory"],
      Legs: ["Under", "Short", "Full"],
      Feet: ["Under", "Shoes"]
    }
  end

  def body_part_grouped_options(validation = false)
    # Array passed into grouped_options_for_select() in _outfit_item_fields.html.erb
    unless validation
      arr = [
        ["Head",
          [ "Crown", "Eyes", "Ears", "Neck" ]],
        ["Upper Body",
          [ "Arm", "Forearm", "Wrist", "Hands", "Finger", "Back", "Chest", "Abdomen", "Waist" ]],
        ["Lower Body",
          [ "Legs", "Feet" ]],
        ["Other",
          [ "Not on Body" ]]
      ]
    else
      arr = ["Crown", "Eyes", "Ears", "Neck", "Arm", "Forearm", "Wrist", "Hands", "Finger", "Back", "Chest", "Abdomen", "Waist", "Legs", "Feet", "Not on Body" ]
    end
    return arr
  end

  # def body_part_grouped_options(validation = false)
  #   # Array passed into grouped_options_for_select() in _outfit_item_fields.html.erb
  #   unless validation
  #     arr = [
  #       ["Head",
  #         [ "Crown", "Eyes", "Ears", "Neck" ]],
  #       ["Upper Body",
  #         [ "Arm", "Forearm", "Hands", "Finger", "Back", "Chest", "Abdomen", "Waist" ]],
  #       ["Lower Body",
  #         [ "Legs", "Feet" ]],
  #       ["Other",
  #         [ "Not on Body" ]]
  #     ]
  #   else
  #     arr = ["Crown", "Eyes", "Ears", "Neck", "Arm", "Forearm", "Hands", "Finger", "Back", "Chest", "Abdomen", "Waist", "Legs", "Feet", "Not on Body" ]
  #   end
  #   return arr
  # end

end
