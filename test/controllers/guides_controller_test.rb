require 'test_helper'

class GuidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guide = guides(:one)
  end

  test "should get index" do
    get guides_url
    assert_response :success
  end

  test "should get new" do
    get new_guide_url
    assert_response :success
  end

  test "should create guide" do
    assert_difference('Guide.count') do
      post guides_url, params: { guide: { account_id: @guide.account_id, brand_id: @guide.brand_id, category: @guide.category, subcategory_one: @guide.subcategory_one, subcategory_two: @guide.subcategory_two, title: @guide.title, user_id: @guide.user_id } }
    end

    assert_redirected_to guide_url(Guide.last)
  end

  test "should show guide" do
    get guide_url(@guide)
    assert_response :success
  end

  test "should get edit" do
    get edit_guide_url(@guide)
    assert_response :success
  end

  test "should update guide" do
    patch guide_url(@guide), params: { guide: { account_id: @guide.account_id, brand_id: @guide.brand_id, category: @guide.category, subcategory_one: @guide.subcategory_one, subcategory_two: @guide.subcategory_two, title: @guide.title, user_id: @guide.user_id } }
    assert_redirected_to guide_url(@guide)
  end

  test "should destroy guide" do
    assert_difference('Guide.count', -1) do
      delete guide_url(@guide)
    end

    assert_redirected_to guides_url
  end
end
