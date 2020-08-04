require 'test_helper'

class BottomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bottom = bottoms(:one)
  end

  test "should get index" do
    get bottoms_url
    assert_response :success
  end

  test "should get new" do
    get new_bottom_url
    assert_response :success
  end

  test "should create bottom" do
    assert_difference('Bottom.count') do
      post bottoms_url, params: { bottom: { brand_id: @bottom.brand_id, description: @bottom.description, gender: @bottom.gender, material: @bottom.material, name: @bottom.name, primary_color: @bottom.primary_color, product_image_data: @bottom.product_image_data, product_url: @bottom.product_url, retail_price: @bottom.retail_price, secondary_color: @bottom.secondary_color, type_of: @bottom.type_of, user_id: @bottom.user_id } }
    end

    assert_redirected_to bottom_url(Bottom.last)
  end

  test "should show bottom" do
    get bottom_url(@bottom)
    assert_response :success
  end

  test "should get edit" do
    get edit_bottom_url(@bottom)
    assert_response :success
  end

  test "should update bottom" do
    patch bottom_url(@bottom), params: { bottom: { brand_id: @bottom.brand_id, description: @bottom.description, gender: @bottom.gender, material: @bottom.material, name: @bottom.name, primary_color: @bottom.primary_color, product_image_data: @bottom.product_image_data, product_url: @bottom.product_url, retail_price: @bottom.retail_price, secondary_color: @bottom.secondary_color, type_of: @bottom.type_of, user_id: @bottom.user_id } }
    assert_redirected_to bottom_url(@bottom)
  end

  test "should destroy bottom" do
    assert_difference('Bottom.count', -1) do
      delete bottom_url(@bottom)
    end

    assert_redirected_to bottoms_url
  end
end
