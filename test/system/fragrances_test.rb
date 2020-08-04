require "application_system_test_case"

class FragrancesTest < ApplicationSystemTestCase
  setup do
    @fragrance = fragrances(:one)
  end

  test "visiting the index" do
    visit fragrances_url
    assert_selector "h1", text: "Fragrances"
  end

  test "creating a Fragrance" do
    visit fragrances_url
    click_on "New Fragrance"

    fill_in "Accords", with: @fragrance.accords
    fill_in "Base notes", with: @fragrance.base_notes
    fill_in "Brand", with: @fragrance.brand_id
    fill_in "Description", with: @fragrance.description
    fill_in "Gender", with: @fragrance.gender
    fill_in "Ingredients", with: @fragrance.ingredients
    fill_in "Middle notes", with: @fragrance.middle_notes
    fill_in "Name", with: @fragrance.name
    fill_in "Product image data", with: @fragrance.product_image_data
    fill_in "Product url", with: @fragrance.product_url
    fill_in "Release date", with: @fragrance.release_date
    fill_in "Retail price", with: @fragrance.retail_price
    fill_in "Top notes", with: @fragrance.top_notes
    fill_in "User", with: @fragrance.user_id
    click_on "Create Fragrance"

    assert_text "Fragrance was successfully created"
    assert_selector "h1", text: "Fragrances"
  end

  test "updating a Fragrance" do
    visit fragrance_url(@fragrance)
    click_on "Edit", match: :first

    fill_in "Accords", with: @fragrance.accords
    fill_in "Base notes", with: @fragrance.base_notes
    fill_in "Brand", with: @fragrance.brand_id
    fill_in "Description", with: @fragrance.description
    fill_in "Gender", with: @fragrance.gender
    fill_in "Ingredients", with: @fragrance.ingredients
    fill_in "Middle notes", with: @fragrance.middle_notes
    fill_in "Name", with: @fragrance.name
    fill_in "Product image data", with: @fragrance.product_image_data
    fill_in "Product url", with: @fragrance.product_url
    fill_in "Release date", with: @fragrance.release_date
    fill_in "Retail price", with: @fragrance.retail_price
    fill_in "Top notes", with: @fragrance.top_notes
    fill_in "User", with: @fragrance.user_id
    click_on "Update Fragrance"

    assert_text "Fragrance was successfully updated"
    assert_selector "h1", text: "Fragrances"
  end

  test "destroying a Fragrance" do
    visit edit_fragrance_url(@fragrance)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Fragrance was successfully destroyed"
  end
end
