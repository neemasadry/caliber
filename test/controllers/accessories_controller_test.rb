require 'test_helper'

class AccessoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accessory = accessories(:one)
  end

  test "should get index" do
    get accessories_url
    assert_response :success
  end

  test "should get new" do
    get new_accessory_url
    assert_response :success
  end

  test "should create accessory" do
    assert_difference('Accessory.count') do
      post accessories_url, params: { accessory: { brand_id: @accessory.brand_id, description: @accessory.description, gender: @accessory.gender, material: @accessory.material, name: @accessory.name, primary_color: @accessory.primary_color, product_image_data: @accessory.product_image_data, product_url: @accessory.product_url, retail_price: @accessory.retail_price, secondary_color: @accessory.secondary_color, type_of: @accessory.type_of, user_id: @accessory.user_id } }
    end

    assert_redirected_to accessory_url(Accessory.last)
  end

  test "should show accessory" do
    get accessory_url(@accessory)
    assert_response :success
  end

  test "should get edit" do
    get edit_accessory_url(@accessory)
    assert_response :success
  end

  test "should update accessory" do
    patch accessory_url(@accessory), params: { accessory: { brand_id: @accessory.brand_id, description: @accessory.description, gender: @accessory.gender, material: @accessory.material, name: @accessory.name, primary_color: @accessory.primary_color, product_image_data: @accessory.product_image_data, product_url: @accessory.product_url, retail_price: @accessory.retail_price, secondary_color: @accessory.secondary_color, type_of: @accessory.type_of, user_id: @accessory.user_id } }
    assert_redirected_to accessory_url(@accessory)
  end

  test "should destroy accessory" do
    assert_difference('Accessory.count', -1) do
      delete accessory_url(@accessory)
    end

    assert_redirected_to accessories_url
  end
end
