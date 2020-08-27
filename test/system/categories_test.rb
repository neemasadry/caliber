require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Category" do
    visit categories_url
    click_on "New Category"

    fill_in "Accessories count", with: @category.accessories_count
    fill_in "Account", with: @category.account_id
    fill_in "Bottoms count", with: @category.bottoms_count
    fill_in "Brands count", with: @category.brands_count
    fill_in "Catalogs count", with: @category.catalogs_count
    fill_in "Category group", with: @category.category_group_id
    fill_in "Cosmetics count", with: @category.cosmetics_count
    fill_in "Dresses count", with: @category.dresses_count
    fill_in "Fragrances count", with: @category.fragrances_count
    fill_in "Guides count", with: @category.guides_count
    fill_in "Jewelries count", with: @category.jewelries_count
    fill_in "Name", with: @category.name
    fill_in "Outfits count", with: @category.outfits_count
    fill_in "Reviews count", with: @category.reviews_count
    fill_in "Shoes count", with: @category.shoes_count
    fill_in "Subcategory count", with: @category.subcategory_count
    fill_in "Suits count", with: @category.suits_count
    fill_in "Tops count", with: @category.tops_count
    fill_in "Total products count", with: @category.total_products_count
    fill_in "User", with: @category.user_id
    click_on "Create Category"

    assert_text "Category was successfully created"
    assert_selector "h1", text: "Categories"
  end

  test "updating a Category" do
    visit category_url(@category)
    click_on "Edit", match: :first

    fill_in "Accessories count", with: @category.accessories_count
    fill_in "Account", with: @category.account_id
    fill_in "Bottoms count", with: @category.bottoms_count
    fill_in "Brands count", with: @category.brands_count
    fill_in "Catalogs count", with: @category.catalogs_count
    fill_in "Category group", with: @category.category_group_id
    fill_in "Cosmetics count", with: @category.cosmetics_count
    fill_in "Dresses count", with: @category.dresses_count
    fill_in "Fragrances count", with: @category.fragrances_count
    fill_in "Guides count", with: @category.guides_count
    fill_in "Jewelries count", with: @category.jewelries_count
    fill_in "Name", with: @category.name
    fill_in "Outfits count", with: @category.outfits_count
    fill_in "Reviews count", with: @category.reviews_count
    fill_in "Shoes count", with: @category.shoes_count
    fill_in "Subcategory count", with: @category.subcategory_count
    fill_in "Suits count", with: @category.suits_count
    fill_in "Tops count", with: @category.tops_count
    fill_in "Total products count", with: @category.total_products_count
    fill_in "User", with: @category.user_id
    click_on "Update Category"

    assert_text "Category was successfully updated"
    assert_selector "h1", text: "Categories"
  end

  test "destroying a Category" do
    visit edit_category_url(@category)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Category was successfully destroyed"
  end
end
