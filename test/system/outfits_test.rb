require "application_system_test_case"

class OutfitsTest < ApplicationSystemTestCase
  setup do
    @outfit = outfits(:one)
  end

  test "visiting the index" do
    visit outfits_url
    assert_selector "h1", text: "Outfits"
  end

  test "creating a Outfit" do
    visit outfits_url
    click_on "New Outfit"

    fill_in "Account", with: @outfit.account_id
    fill_in "Brand", with: @outfit.brand_id
    fill_in "Description", with: @outfit.description
    fill_in "Dress code", with: @outfit.dress_code
    fill_in "Name", with: @outfit.name
    fill_in "Occasion", with: @outfit.occasion
    fill_in "Total number of products", with: @outfit.total_number_of_products
    fill_in "Total price", with: @outfit.total_price
    fill_in "User", with: @outfit.user_id
    click_on "Create Outfit"

    assert_text "Outfit was successfully created"
    assert_selector "h1", text: "Outfits"
  end

  test "updating a Outfit" do
    visit outfit_url(@outfit)
    click_on "Edit", match: :first

    fill_in "Account", with: @outfit.account_id
    fill_in "Brand", with: @outfit.brand_id
    fill_in "Description", with: @outfit.description
    fill_in "Dress code", with: @outfit.dress_code
    fill_in "Name", with: @outfit.name
    fill_in "Occasion", with: @outfit.occasion
    fill_in "Total number of products", with: @outfit.total_number_of_products
    fill_in "Total price", with: @outfit.total_price
    fill_in "User", with: @outfit.user_id
    click_on "Update Outfit"

    assert_text "Outfit was successfully updated"
    assert_selector "h1", text: "Outfits"
  end

  test "destroying a Outfit" do
    visit edit_outfit_url(@outfit)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Outfit was successfully destroyed"
  end
end
