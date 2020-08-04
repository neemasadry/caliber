require "application_system_test_case"

class BottomsTest < ApplicationSystemTestCase
  setup do
    @bottom = bottoms(:one)
  end

  test "visiting the index" do
    visit bottoms_url
    assert_selector "h1", text: "Bottoms"
  end

  test "creating a Bottom" do
    visit bottoms_url
    click_on "New Bottom"

    fill_in "Brand", with: @bottom.brand_id
    fill_in "Description", with: @bottom.description
    fill_in "Gender", with: @bottom.gender
    fill_in "Material", with: @bottom.material
    fill_in "Name", with: @bottom.name
    fill_in "Primary color", with: @bottom.primary_color
    fill_in "Product image data", with: @bottom.product_image_data
    fill_in "Product url", with: @bottom.product_url
    fill_in "Retail price", with: @bottom.retail_price
    fill_in "Secondary color", with: @bottom.secondary_color
    fill_in "Type of", with: @bottom.type_of
    fill_in "User", with: @bottom.user_id
    click_on "Create Bottom"

    assert_text "Bottom was successfully created"
    assert_selector "h1", text: "Bottoms"
  end

  test "updating a Bottom" do
    visit bottom_url(@bottom)
    click_on "Edit", match: :first

    fill_in "Brand", with: @bottom.brand_id
    fill_in "Description", with: @bottom.description
    fill_in "Gender", with: @bottom.gender
    fill_in "Material", with: @bottom.material
    fill_in "Name", with: @bottom.name
    fill_in "Primary color", with: @bottom.primary_color
    fill_in "Product image data", with: @bottom.product_image_data
    fill_in "Product url", with: @bottom.product_url
    fill_in "Retail price", with: @bottom.retail_price
    fill_in "Secondary color", with: @bottom.secondary_color
    fill_in "Type of", with: @bottom.type_of
    fill_in "User", with: @bottom.user_id
    click_on "Update Bottom"

    assert_text "Bottom was successfully updated"
    assert_selector "h1", text: "Bottoms"
  end

  test "destroying a Bottom" do
    visit edit_bottom_url(@bottom)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Bottom was successfully destroyed"
  end
end
