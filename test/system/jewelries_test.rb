require "application_system_test_case"

class JewelriesTest < ApplicationSystemTestCase
  setup do
    @jewelry = jewelries(:one)
  end

  test "visiting the index" do
    visit jewelries_url
    assert_selector "h1", text: "Jewelries"
  end

  test "creating a Jewelry" do
    visit jewelries_url
    click_on "New Jewelry"

    fill_in "Brand", with: @jewelry.brand_id
    fill_in "Description", with: @jewelry.description
    fill_in "Gender", with: @jewelry.gender
    fill_in "Material", with: @jewelry.material
    fill_in "Name", with: @jewelry.name
    fill_in "Primary color", with: @jewelry.primary_color
    fill_in "Product image data", with: @jewelry.product_image_data
    fill_in "Product url", with: @jewelry.product_url
    fill_in "Retail price", with: @jewelry.retail_price
    fill_in "Secondary color", with: @jewelry.secondary_color
    fill_in "Type of", with: @jewelry.type_of
    fill_in "User", with: @jewelry.user_id
    click_on "Create Jewelry"

    assert_text "Jewelry was successfully created"
    assert_selector "h1", text: "Jewelries"
  end

  test "updating a Jewelry" do
    visit jewelry_url(@jewelry)
    click_on "Edit", match: :first

    fill_in "Brand", with: @jewelry.brand_id
    fill_in "Description", with: @jewelry.description
    fill_in "Gender", with: @jewelry.gender
    fill_in "Material", with: @jewelry.material
    fill_in "Name", with: @jewelry.name
    fill_in "Primary color", with: @jewelry.primary_color
    fill_in "Product image data", with: @jewelry.product_image_data
    fill_in "Product url", with: @jewelry.product_url
    fill_in "Retail price", with: @jewelry.retail_price
    fill_in "Secondary color", with: @jewelry.secondary_color
    fill_in "Type of", with: @jewelry.type_of
    fill_in "User", with: @jewelry.user_id
    click_on "Update Jewelry"

    assert_text "Jewelry was successfully updated"
    assert_selector "h1", text: "Jewelries"
  end

  test "destroying a Jewelry" do
    visit edit_jewelry_url(@jewelry)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Jewelry was successfully destroyed"
  end
end
