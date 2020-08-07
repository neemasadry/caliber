require "application_system_test_case"

class GuidesTest < ApplicationSystemTestCase
  setup do
    @guide = guides(:one)
  end

  test "visiting the index" do
    visit guides_url
    assert_selector "h1", text: "Guides"
  end

  test "creating a Guide" do
    visit guides_url
    click_on "New Guide"

    fill_in "Account", with: @guide.account_id
    fill_in "Brand", with: @guide.brand_id
    fill_in "Category", with: @guide.category
    fill_in "Subcategory one", with: @guide.subcategory_one
    fill_in "Subcategory two", with: @guide.subcategory_two
    fill_in "Title", with: @guide.title
    fill_in "User", with: @guide.user_id
    click_on "Create Guide"

    assert_text "Guide was successfully created"
    assert_selector "h1", text: "Guides"
  end

  test "updating a Guide" do
    visit guide_url(@guide)
    click_on "Edit", match: :first

    fill_in "Account", with: @guide.account_id
    fill_in "Brand", with: @guide.brand_id
    fill_in "Category", with: @guide.category
    fill_in "Subcategory one", with: @guide.subcategory_one
    fill_in "Subcategory two", with: @guide.subcategory_two
    fill_in "Title", with: @guide.title
    fill_in "User", with: @guide.user_id
    click_on "Update Guide"

    assert_text "Guide was successfully updated"
    assert_selector "h1", text: "Guides"
  end

  test "destroying a Guide" do
    visit edit_guide_url(@guide)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Guide was successfully destroyed"
  end
end
