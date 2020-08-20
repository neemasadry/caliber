module OutfitsHelper

  def body_part_grouped_options
    # Array passed into grouped_options_for_select() in _outfit_item_fields.html.erb
    [
      ["Head",
        ["Crown", "Eyes", "Ears", "Neck"]],
      ["Upper Body",
        [ "Arm", "Forearm", "Hands", "Finger", "Back", "Chest", "Abdomen", "Waist" ]],
      ["Lower Body",
        ["Legs", "Feet"]],
      ["Other",
        ["Not on Body"]]
    ]
  end

end
