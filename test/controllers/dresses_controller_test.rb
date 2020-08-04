require 'test_helper'

class DressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dress = dresses(:one)
  end

  test "should get index" do
    get dresses_url
    assert_response :success
  end

  test "should get new" do
    get new_dress_url
    assert_response :success
  end

  test "should create dress" do
    assert_difference('Dress.count') do
      post dresses_url, params: { dress: { brand_id: @dress.brand_id, description: @dress.description, gender: @dress.gender, material: @dress.material, name: @dress.name, primary_color: @dress.primary_color, product_image_data: @dress.product_image_data, product_url: @dress.product_url, retail_price: @dress.retail_price, secondary_color: @dress.secondary_color, type_of: @dress.type_of, user_id: @dress.user_id } }
    end

    assert_redirected_to dress_url(Dress.last)
  end

  test "should show dress" do
    get dress_url(@dress)
    assert_response :success
  end

  test "should get edit" do
    get edit_dress_url(@dress)
    assert_response :success
  end

  test "should update dress" do
    patch dress_url(@dress), params: { dress: { brand_id: @dress.brand_id, description: @dress.description, gender: @dress.gender, material: @dress.material, name: @dress.name, primary_color: @dress.primary_color, product_image_data: @dress.product_image_data, product_url: @dress.product_url, retail_price: @dress.retail_price, secondary_color: @dress.secondary_color, type_of: @dress.type_of, user_id: @dress.user_id } }
    assert_redirected_to dress_url(@dress)
  end

  test "should destroy dress" do
    assert_difference('Dress.count', -1) do
      delete dress_url(@dress)
    end

    assert_redirected_to dresses_url
  end
end
