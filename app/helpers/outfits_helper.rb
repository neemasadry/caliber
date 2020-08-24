module OutfitsHelper

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
