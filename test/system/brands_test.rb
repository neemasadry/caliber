require "application_system_test_case"

class BrandsTest < ApplicationSystemTestCase
  setup do
    @brand = brands(:one)
  end

  test "visiting the index" do
    visit brands_url
    assert_selector "h1", text: "Brands"
  end

  test "creating a Brand" do
    visit brands_url
    click_on "New Brand"

    fill_in "About", with: @brand.about
    fill_in "Account", with: @brand.account_id
    fill_in "Address1", with: @brand.address1
    fill_in "Address2", with: @brand.address2
    fill_in "Alias", with: @brand.alias
    fill_in "Brand image data", with: @brand.brand_image_data
    fill_in "Category", with: @brand.category
    fill_in "City", with: @brand.city
    fill_in "Country code", with: @brand.country_code
    fill_in "Email", with: @brand.email
    fill_in "Facebook link", with: @brand.facebook_link
    fill_in "Founding date", with: @brand.founding_date
    fill_in "Homepage link", with: @brand.homepage_link
    fill_in "Instagram link", with: @brand.instagram_link
    fill_in "Mission", with: @brand.mission
    fill_in "Name", with: @brand.name
    fill_in "Phone", with: @brand.phone
    fill_in "Pinterest link", with: @brand.pinterest_link
    fill_in "Price range", with: @brand.price_range
    fill_in "Slug", with: @brand.slug
    fill_in "Snapchat link", with: @brand.snapchat_link
    fill_in "State code", with: @brand.state_code
    fill_in "Story", with: @brand.story
    fill_in "Tiktok link", with: @brand.tiktok_link
    fill_in "Twitter link", with: @brand.twitter_link
    fill_in "User", with: @brand.user_id
    fill_in "Youtube link", with: @brand.youtube_link
    fill_in "Zipcode", with: @brand.zipcode
    click_on "Create Brand"

    assert_text "Brand was successfully created"
    assert_selector "h1", text: "Brands"
  end

  test "updating a Brand" do
    visit brand_url(@brand)
    click_on "Edit", match: :first

    fill_in "About", with: @brand.about
    fill_in "Account", with: @brand.account_id
    fill_in "Address1", with: @brand.address1
    fill_in "Address2", with: @brand.address2
    fill_in "Alias", with: @brand.alias
    fill_in "Brand image data", with: @brand.brand_image_data
    fill_in "Category", with: @brand.category
    fill_in "City", with: @brand.city
    fill_in "Country code", with: @brand.country_code
    fill_in "Email", with: @brand.email
    fill_in "Facebook link", with: @brand.facebook_link
    fill_in "Founding date", with: @brand.founding_date
    fill_in "Homepage link", with: @brand.homepage_link
    fill_in "Instagram link", with: @brand.instagram_link
    fill_in "Mission", with: @brand.mission
    fill_in "Name", with: @brand.name
    fill_in "Phone", with: @brand.phone
    fill_in "Pinterest link", with: @brand.pinterest_link
    fill_in "Price range", with: @brand.price_range
    fill_in "Slug", with: @brand.slug
    fill_in "Snapchat link", with: @brand.snapchat_link
    fill_in "State code", with: @brand.state_code
    fill_in "Story", with: @brand.story
    fill_in "Tiktok link", with: @brand.tiktok_link
    fill_in "Twitter link", with: @brand.twitter_link
    fill_in "User", with: @brand.user_id
    fill_in "Youtube link", with: @brand.youtube_link
    fill_in "Zipcode", with: @brand.zipcode
    click_on "Update Brand"

    assert_text "Brand was successfully updated"
    assert_selector "h1", text: "Brands"
  end

  test "destroying a Brand" do
    visit edit_brand_url(@brand)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Brand was successfully destroyed"
  end
end
