require "application_system_test_case"

class ShoesTest < ApplicationSystemTestCase
  setup do
    @shoe = shoes(:one)
  end

  test "visiting the index" do
    visit shoes_url
    assert_selector "h1", text: "Shoes"
  end

  test "creating a Shoe" do
    visit shoes_url
    click_on "New Shoe"

    fill_in "Brand", with: @shoe.brand_id
    fill_in "Description", with: @shoe.description
    fill_in "Gender", with: @shoe.gender
    fill_in "Material", with: @shoe.material
    fill_in "Name", with: @shoe.name
    fill_in "Primary color", with: @shoe.primary_color
    fill_in "Product image data", with: @shoe.product_image_data
    fill_in "Product url", with: @shoe.product_url
    fill_in "Retail price", with: @shoe.retail_price
    fill_in "Secondary color", with: @shoe.secondary_color
    fill_in "Type of", with: @shoe.type_of
    fill_in "User", with: @shoe.user_id
    click_on "Create Shoe"

    assert_text "Shoe was successfully created"
    assert_selector "h1", text: "Shoes"
  end

  test "updating a Shoe" do
    visit shoe_url(@shoe)
    click_on "Edit", match: :first

    fill_in "Brand", with: @shoe.brand_id
    fill_in "Description", with: @shoe.description
    fill_in "Gender", with: @shoe.gender
    fill_in "Material", with: @shoe.material
    fill_in "Name", with: @shoe.name
    fill_in "Primary color", with: @shoe.primary_color
    fill_in "Product image data", with: @shoe.product_image_data
    fill_in "Product url", with: @shoe.product_url
    fill_in "Retail price", with: @shoe.retail_price
    fill_in "Secondary color", with: @shoe.secondary_color
    fill_in "Type of", with: @shoe.type_of
    fill_in "User", with: @shoe.user_id
    click_on "Update Shoe"

    assert_text "Shoe was successfully updated"
    assert_selector "h1", text: "Shoes"
  end

  test "destroying a Shoe" do
    visit edit_shoe_url(@shoe)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Shoe was successfully destroyed"
  end
end
