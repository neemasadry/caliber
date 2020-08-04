require "application_system_test_case"

class TopsTest < ApplicationSystemTestCase
  setup do
    @top = tops(:one)
  end

  test "visiting the index" do
    visit tops_url
    assert_selector "h1", text: "Tops"
  end

  test "creating a Top" do
    visit tops_url
    click_on "New Top"

    fill_in "Brand", with: @top.brand_id
    fill_in "Description", with: @top.description
    fill_in "Gender", with: @top.gender
    fill_in "Material", with: @top.material
    fill_in "Name", with: @top.name
    fill_in "Primary color", with: @top.primary_color
    fill_in "Product image data", with: @top.product_image_data
    fill_in "Product url", with: @top.product_url
    fill_in "Retail price", with: @top.retail_price
    fill_in "Secondary color", with: @top.secondary_color
    fill_in "Type of", with: @top.type_of
    fill_in "User", with: @top.user_id
    click_on "Create Top"

    assert_text "Top was successfully created"
    assert_selector "h1", text: "Tops"
  end

  test "updating a Top" do
    visit top_url(@top)
    click_on "Edit", match: :first

    fill_in "Brand", with: @top.brand_id
    fill_in "Description", with: @top.description
    fill_in "Gender", with: @top.gender
    fill_in "Material", with: @top.material
    fill_in "Name", with: @top.name
    fill_in "Primary color", with: @top.primary_color
    fill_in "Product image data", with: @top.product_image_data
    fill_in "Product url", with: @top.product_url
    fill_in "Retail price", with: @top.retail_price
    fill_in "Secondary color", with: @top.secondary_color
    fill_in "Type of", with: @top.type_of
    fill_in "User", with: @top.user_id
    click_on "Update Top"

    assert_text "Top was successfully updated"
    assert_selector "h1", text: "Tops"
  end

  test "destroying a Top" do
    visit edit_top_url(@top)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Top was successfully destroyed"
  end
end
