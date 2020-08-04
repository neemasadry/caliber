require "application_system_test_case"

class DressesTest < ApplicationSystemTestCase
  setup do
    @dress = dresses(:one)
  end

  test "visiting the index" do
    visit dresses_url
    assert_selector "h1", text: "Dresses"
  end

  test "creating a Dress" do
    visit dresses_url
    click_on "New Dress"

    fill_in "Brand", with: @dress.brand_id
    fill_in "Description", with: @dress.description
    fill_in "Gender", with: @dress.gender
    fill_in "Material", with: @dress.material
    fill_in "Name", with: @dress.name
    fill_in "Primary color", with: @dress.primary_color
    fill_in "Product image data", with: @dress.product_image_data
    fill_in "Product url", with: @dress.product_url
    fill_in "Retail price", with: @dress.retail_price
    fill_in "Secondary color", with: @dress.secondary_color
    fill_in "Type of", with: @dress.type_of
    fill_in "User", with: @dress.user_id
    click_on "Create Dress"

    assert_text "Dress was successfully created"
    assert_selector "h1", text: "Dresses"
  end

  test "updating a Dress" do
    visit dress_url(@dress)
    click_on "Edit", match: :first

    fill_in "Brand", with: @dress.brand_id
    fill_in "Description", with: @dress.description
    fill_in "Gender", with: @dress.gender
    fill_in "Material", with: @dress.material
    fill_in "Name", with: @dress.name
    fill_in "Primary color", with: @dress.primary_color
    fill_in "Product image data", with: @dress.product_image_data
    fill_in "Product url", with: @dress.product_url
    fill_in "Retail price", with: @dress.retail_price
    fill_in "Secondary color", with: @dress.secondary_color
    fill_in "Type of", with: @dress.type_of
    fill_in "User", with: @dress.user_id
    click_on "Update Dress"

    assert_text "Dress was successfully updated"
    assert_selector "h1", text: "Dresses"
  end

  test "destroying a Dress" do
    visit edit_dress_url(@dress)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Dress was successfully destroyed"
  end
end
