require "application_system_test_case"

class AccessoriesTest < ApplicationSystemTestCase
  setup do
    @accessory = accessories(:one)
  end

  test "visiting the index" do
    visit accessories_url
    assert_selector "h1", text: "Accessories"
  end

  test "creating a Accessory" do
    visit accessories_url
    click_on "New Accessory"

    fill_in "Brand", with: @accessory.brand_id
    fill_in "Description", with: @accessory.description
    fill_in "Gender", with: @accessory.gender
    fill_in "Material", with: @accessory.material
    fill_in "Name", with: @accessory.name
    fill_in "Primary color", with: @accessory.primary_color
    fill_in "Product image data", with: @accessory.product_image_data
    fill_in "Product url", with: @accessory.product_url
    fill_in "Retail price", with: @accessory.retail_price
    fill_in "Secondary color", with: @accessory.secondary_color
    fill_in "Type of", with: @accessory.type_of
    fill_in "User", with: @accessory.user_id
    click_on "Create Accessory"

    assert_text "Accessory was successfully created"
    assert_selector "h1", text: "Accessories"
  end

  test "updating a Accessory" do
    visit accessory_url(@accessory)
    click_on "Edit", match: :first

    fill_in "Brand", with: @accessory.brand_id
    fill_in "Description", with: @accessory.description
    fill_in "Gender", with: @accessory.gender
    fill_in "Material", with: @accessory.material
    fill_in "Name", with: @accessory.name
    fill_in "Primary color", with: @accessory.primary_color
    fill_in "Product image data", with: @accessory.product_image_data
    fill_in "Product url", with: @accessory.product_url
    fill_in "Retail price", with: @accessory.retail_price
    fill_in "Secondary color", with: @accessory.secondary_color
    fill_in "Type of", with: @accessory.type_of
    fill_in "User", with: @accessory.user_id
    click_on "Update Accessory"

    assert_text "Accessory was successfully updated"
    assert_selector "h1", text: "Accessories"
  end

  test "destroying a Accessory" do
    visit edit_accessory_url(@accessory)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Accessory was successfully destroyed"
  end
end
