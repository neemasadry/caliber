require "application_system_test_case"

class OutfitCatalogsTest < ApplicationSystemTestCase
  setup do
    @outfit_catalog = outfit_catalogs(:one)
  end

  test "visiting the index" do
    visit outfit_catalogs_url
    assert_selector "h1", text: "Outfit Catalogs"
  end

  test "creating a Outfit catalog" do
    visit outfit_catalogs_url
    click_on "New Outfit Catalog"

    fill_in "Account", with: @outfit_catalog.account_id
    fill_in "Brand", with: @outfit_catalog.brand_id
    fill_in "Category", with: @outfit_catalog.category
    fill_in "Description", with: @outfit_catalog.description
    fill_in "Title", with: @outfit_catalog.title
    fill_in "Total number of outfits", with: @outfit_catalog.total_number_of_outfits
    fill_in "Total price", with: @outfit_catalog.total_price
    fill_in "User", with: @outfit_catalog.user_id
    click_on "Create Outfit catalog"

    assert_text "Outfit catalog was successfully created"
    assert_selector "h1", text: "Outfit Catalogs"
  end

  test "updating a Outfit catalog" do
    visit outfit_catalog_url(@outfit_catalog)
    click_on "Edit", match: :first

    fill_in "Account", with: @outfit_catalog.account_id
    fill_in "Brand", with: @outfit_catalog.brand_id
    fill_in "Category", with: @outfit_catalog.category
    fill_in "Description", with: @outfit_catalog.description
    fill_in "Title", with: @outfit_catalog.title
    fill_in "Total number of outfits", with: @outfit_catalog.total_number_of_outfits
    fill_in "Total price", with: @outfit_catalog.total_price
    fill_in "User", with: @outfit_catalog.user_id
    click_on "Update Outfit catalog"

    assert_text "Outfit catalog was successfully updated"
    assert_selector "h1", text: "Outfit Catalogs"
  end

  test "destroying a Outfit catalog" do
    visit edit_outfit_catalog_url(@outfit_catalog)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Outfit catalog was successfully destroyed"
  end
end
