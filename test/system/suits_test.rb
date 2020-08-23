require "application_system_test_case"

class SuitsTest < ApplicationSystemTestCase
  setup do
    @suit = suits(:one)
  end

  test "visiting the index" do
    visit suits_url
    assert_selector "h1", text: "Suits"
  end

  test "creating a Suit" do
    visit suits_url
    click_on "New Suit"

    fill_in "Account", with: @suit.account_id
    fill_in "Bottom", with: @suit.bottom_id
    fill_in "Brand", with: @suit.brand_id
    fill_in "Description", with: @suit.description
    fill_in "Gender", with: @suit.gender
    fill_in "Jacket breasted style", with: @suit.jacket_breasted_style
    fill_in "Jacket lapel style", with: @suit.jacket_lapel_style
    fill_in "Jacket number of buttons", with: @suit.jacket_number_of_buttons
    fill_in "Jacket pocket style", with: @suit.jacket_pocket_style
    fill_in "Jacket sleeve buttons", with: @suit.jacket_sleeve_buttons
    check "Jacket ticket pocket" if @suit.jacket_ticket_pocket
    fill_in "Jacket vents style", with: @suit.jacket_vents_style
    fill_in "Materials", with: @suit.materials
    fill_in "Name", with: @suit.name
    fill_in "Primary color", with: @suit.primary_color
    fill_in "Product url", with: @suit.product_url
    fill_in "Retail price", with: @suit.retail_price
    fill_in "Secondary color", with: @suit.secondary_color
    fill_in "Top", with: @suit.top_id
    fill_in "Trouser cuff", with: @suit.trouser_cuff
    fill_in "Trouser pleats", with: @suit.trouser_pleats
    fill_in "Trouser waistband style", with: @suit.trouser_waistband_style
    fill_in "User", with: @suit.user_id
    click_on "Create Suit"

    assert_text "Suit was successfully created"
    assert_selector "h1", text: "Suits"
  end

  test "updating a Suit" do
    visit suit_url(@suit)
    click_on "Edit", match: :first

    fill_in "Account", with: @suit.account_id
    fill_in "Bottom", with: @suit.bottom_id
    fill_in "Brand", with: @suit.brand_id
    fill_in "Description", with: @suit.description
    fill_in "Gender", with: @suit.gender
    fill_in "Jacket breasted style", with: @suit.jacket_breasted_style
    fill_in "Jacket lapel style", with: @suit.jacket_lapel_style
    fill_in "Jacket number of buttons", with: @suit.jacket_number_of_buttons
    fill_in "Jacket pocket style", with: @suit.jacket_pocket_style
    fill_in "Jacket sleeve buttons", with: @suit.jacket_sleeve_buttons
    check "Jacket ticket pocket" if @suit.jacket_ticket_pocket
    fill_in "Jacket vents style", with: @suit.jacket_vents_style
    fill_in "Materials", with: @suit.materials
    fill_in "Name", with: @suit.name
    fill_in "Primary color", with: @suit.primary_color
    fill_in "Product url", with: @suit.product_url
    fill_in "Retail price", with: @suit.retail_price
    fill_in "Secondary color", with: @suit.secondary_color
    fill_in "Top", with: @suit.top_id
    fill_in "Trouser cuff", with: @suit.trouser_cuff
    fill_in "Trouser pleats", with: @suit.trouser_pleats
    fill_in "Trouser waistband style", with: @suit.trouser_waistband_style
    fill_in "User", with: @suit.user_id
    click_on "Update Suit"

    assert_text "Suit was successfully updated"
    assert_selector "h1", text: "Suits"
  end

  test "destroying a Suit" do
    visit edit_suit_url(@suit)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Suit was successfully destroyed"
  end
end
