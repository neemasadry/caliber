require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Account", with: @product.account_id
    fill_in "Brand", with: @product.brand_id
    fill_in "Name", with: @product.name
    fill_in "Productable", with: @product.productable_id
    fill_in "Productable type", with: @product.productable_type
    fill_in "User", with: @product.user_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    assert_selector "h1", text: "Products"
  end

  test "updating a Product" do
    visit product_url(@product)
    click_on "Edit", match: :first

    fill_in "Account", with: @product.account_id
    fill_in "Brand", with: @product.brand_id
    fill_in "Name", with: @product.name
    fill_in "Productable", with: @product.productable_id
    fill_in "Productable type", with: @product.productable_type
    fill_in "User", with: @product.user_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    assert_selector "h1", text: "Products"
  end

  test "destroying a Product" do
    visit edit_product_url(@product)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Product was successfully destroyed"
  end
end
