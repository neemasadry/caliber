require 'test_helper'

class JewelriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jewelry = jewelries(:one)
  end

  test "should get index" do
    get jewelries_url
    assert_response :success
  end

  test "should get new" do
    get new_jewelry_url
    assert_response :success
  end

  test "should create jewelry" do
    assert_difference('Jewelry.count') do
      post jewelries_url, params: { jewelry: { brand_id: @jewelry.brand_id, description: @jewelry.description, gender: @jewelry.gender, material: @jewelry.material, name: @jewelry.name, primary_color: @jewelry.primary_color, product_image_data: @jewelry.product_image_data, product_url: @jewelry.product_url, retail_price: @jewelry.retail_price, secondary_color: @jewelry.secondary_color, type_of: @jewelry.type_of, user_id: @jewelry.user_id } }
    end

    assert_redirected_to jewelry_url(Jewelry.last)
  end

  test "should show jewelry" do
    get jewelry_url(@jewelry)
    assert_response :success
  end

  test "should get edit" do
    get edit_jewelry_url(@jewelry)
    assert_response :success
  end

  test "should update jewelry" do
    patch jewelry_url(@jewelry), params: { jewelry: { brand_id: @jewelry.brand_id, description: @jewelry.description, gender: @jewelry.gender, material: @jewelry.material, name: @jewelry.name, primary_color: @jewelry.primary_color, product_image_data: @jewelry.product_image_data, product_url: @jewelry.product_url, retail_price: @jewelry.retail_price, secondary_color: @jewelry.secondary_color, type_of: @jewelry.type_of, user_id: @jewelry.user_id } }
    assert_redirected_to jewelry_url(@jewelry)
  end

  test "should destroy jewelry" do
    assert_difference('Jewelry.count', -1) do
      delete jewelry_url(@jewelry)
    end

    assert_redirected_to jewelries_url
  end
end
