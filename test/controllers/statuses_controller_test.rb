require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_status_url
    assert_response :success
  end

  test "should create status" do
    assert_difference('Status.count') do
      post statuses_url, params: { status: { account_id: @status.account_id, brand_id: @status.brand_id, description: @status.description, discarded_at: @status.discarded_at, status_image_data: @status.status_image_data, status_video_data: @status.status_video_data, title: @status.title, user_id: @status.user_id } }
    end

    assert_redirected_to status_url(Status.last)
  end

  test "should show status" do
    get status_url(@status)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_url(@status)
    assert_response :success
  end

  test "should update status" do
    patch status_url(@status), params: { status: { account_id: @status.account_id, brand_id: @status.brand_id, description: @status.description, discarded_at: @status.discarded_at, status_image_data: @status.status_image_data, status_video_data: @status.status_video_data, title: @status.title, user_id: @status.user_id } }
    assert_redirected_to status_url(@status)
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete status_url(@status)
    end

    assert_redirected_to statuses_url
  end
end
