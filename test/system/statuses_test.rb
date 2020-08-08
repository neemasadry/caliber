require "application_system_test_case"

class StatusesTest < ApplicationSystemTestCase
  setup do
    @status = statuses(:one)
  end

  test "visiting the index" do
    visit statuses_url
    assert_selector "h1", text: "Statuses"
  end

  test "creating a Status" do
    visit statuses_url
    click_on "New Status"

    fill_in "Account", with: @status.account_id
    fill_in "Brand", with: @status.brand_id
    fill_in "Description", with: @status.description
    fill_in "Discarded at", with: @status.discarded_at
    fill_in "Status image data", with: @status.status_image_data
    fill_in "Status video data", with: @status.status_video_data
    fill_in "Title", with: @status.title
    fill_in "User", with: @status.user_id
    click_on "Create Status"

    assert_text "Status was successfully created"
    assert_selector "h1", text: "Statuses"
  end

  test "updating a Status" do
    visit status_url(@status)
    click_on "Edit", match: :first

    fill_in "Account", with: @status.account_id
    fill_in "Brand", with: @status.brand_id
    fill_in "Description", with: @status.description
    fill_in "Discarded at", with: @status.discarded_at
    fill_in "Status image data", with: @status.status_image_data
    fill_in "Status video data", with: @status.status_video_data
    fill_in "Title", with: @status.title
    fill_in "User", with: @status.user_id
    click_on "Update Status"

    assert_text "Status was successfully updated"
    assert_selector "h1", text: "Statuses"
  end

  test "destroying a Status" do
    visit edit_status_url(@status)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Status was successfully destroyed"
  end
end
