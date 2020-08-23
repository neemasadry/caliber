module OutfitsHelper

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
