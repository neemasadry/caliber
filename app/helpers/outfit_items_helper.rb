module OutfitItemsHelper

  def body_categorization(include_limits = false)
    if include_limits == true
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
    else
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
  end # def

end
