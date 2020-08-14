require "application_system_test_case"

class CatalogsTest < ApplicationSystemTestCase
  setup do
    @catalog = catalogs(:one)
  end

  test "visiting the index" do
    visit catalogs_url
    assert_selector "h1", text: "Catalogs"
  end

  test "creating a Catalog" do
    visit catalogs_url
    click_on "New Catalog"

    fill_in "Account", with: @catalog.account_id
    fill_in "Brand", with: @catalog.brand_id
    fill_in "Category", with: @catalog.category
    fill_in "Description", with: @catalog.description
    fill_in "Title", with: @catalog.title
    fill_in "Total number of outfits", with: @catalog.total_number_of_outfits
    fill_in "Total price", with: @catalog.total_price
    fill_in "User", with: @catalog.user_id
    click_on "Create Catalog"

    assert_text "Catalog was successfully created"
    assert_selector "h1", text: "Catalogs"
  end

  test "updating a Catalog" do
    visit catalog_url(@catalog)
    click_on "Edit", match: :first

    fill_in "Account", with: @catalog.account_id
    fill_in "Brand", with: @catalog.brand_id
    fill_in "Category", with: @catalog.category
    fill_in "Description", with: @catalog.description
    fill_in "Title", with: @catalog.title
    fill_in "Total number of outfits", with: @catalog.total_number_of_outfits
    fill_in "Total price", with: @catalog.total_price
    fill_in "User", with: @catalog.user_id
    click_on "Update Catalog"

    assert_text "Catalog was successfully updated"
    assert_selector "h1", text: "Catalogs"
  end

  test "destroying a Catalog" do
    visit edit_catalog_url(@catalog)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Catalog was successfully destroyed"
  end
end
