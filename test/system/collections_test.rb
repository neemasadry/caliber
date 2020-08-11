require "application_system_test_case"

class CollectionsTest < ApplicationSystemTestCase
  setup do
    @collection = collections(:one)
  end

  test "visiting the index" do
    visit collections_url
    assert_selector "h1", text: "Collections"
  end

  test "creating a Collection" do
    visit collections_url
    click_on "New Collection"

    fill_in "Collection type", with: @collection.collection_type
    fill_in "Total items", with: @collection.total_items
    fill_in "Total price", with: @collection.total_price
    fill_in "User", with: @collection.user_id
    click_on "Create Collection"

    assert_text "Collection was successfully created"
    assert_selector "h1", text: "Collections"
  end

  test "updating a Collection" do
    visit collection_url(@collection)
    click_on "Edit", match: :first

    fill_in "Collection type", with: @collection.collection_type
    fill_in "Total items", with: @collection.total_items
    fill_in "Total price", with: @collection.total_price
    fill_in "User", with: @collection.user_id
    click_on "Update Collection"

    assert_text "Collection was successfully updated"
    assert_selector "h1", text: "Collections"
  end

  test "destroying a Collection" do
    visit edit_collection_url(@collection)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Collection was successfully destroyed"
  end
end
