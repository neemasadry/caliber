require "application_system_test_case"

class CosmeticsTest < ApplicationSystemTestCase
  setup do
    @cosmetic = cosmetics(:one)
  end

  test "visiting the index" do
    visit cosmetics_url
    assert_selector "h1", text: "Cosmetics"
  end

  test "creating a Cosmetic" do
    visit cosmetics_url
    click_on "New Cosmetic"

    fill_in "Brand", with: @cosmetic.brand_id
    fill_in "Description", with: @cosmetic.description
    fill_in "Gender", with: @cosmetic.gender
    fill_in "Ingredients", with: @cosmetic.ingredients
    fill_in "Name", with: @cosmetic.name
    fill_in "Product image data", with: @cosmetic.product_image_data
    fill_in "Product url", with: @cosmetic.product_url
    fill_in "Retail price", with: @cosmetic.retail_price
    fill_in "Type of", with: @cosmetic.type_of
    fill_in "User", with: @cosmetic.user_id
    click_on "Create Cosmetic"

    assert_text "Cosmetic was successfully created"
    assert_selector "h1", text: "Cosmetics"
  end

  test "updating a Cosmetic" do
    visit cosmetic_url(@cosmetic)
    click_on "Edit", match: :first

    fill_in "Brand", with: @cosmetic.brand_id
    fill_in "Description", with: @cosmetic.description
    fill_in "Gender", with: @cosmetic.gender
    fill_in "Ingredients", with: @cosmetic.ingredients
    fill_in "Name", with: @cosmetic.name
    fill_in "Product image data", with: @cosmetic.product_image_data
    fill_in "Product url", with: @cosmetic.product_url
    fill_in "Retail price", with: @cosmetic.retail_price
    fill_in "Type of", with: @cosmetic.type_of
    fill_in "User", with: @cosmetic.user_id
    click_on "Update Cosmetic"

    assert_text "Cosmetic was successfully updated"
    assert_selector "h1", text: "Cosmetics"
  end

  test "destroying a Cosmetic" do
    visit edit_cosmetic_url(@cosmetic)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Cosmetic was successfully destroyed"
  end
end
