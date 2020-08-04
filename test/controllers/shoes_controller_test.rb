require 'test_helper'

class ShoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoe = shoes(:one)
  end

  test "should get index" do
    get shoes_url
    assert_response :success
  end

  test "should get new" do
    get new_shoe_url
    assert_response :success
  end

  test "should create shoe" do
    assert_difference('Shoe.count') do
      post shoes_url, params: { shoe: { brand_id: @shoe.brand_id, description: @shoe.description, gender: @shoe.gender, material: @shoe.material, name: @shoe.name, primary_color: @shoe.primary_color, product_image_data: @shoe.product_image_data, product_url: @shoe.product_url, retail_price: @shoe.retail_price, secondary_color: @shoe.secondary_color, type_of: @shoe.type_of, user_id: @shoe.user_id } }
    end

    assert_redirected_to shoe_url(Shoe.last)
  end

  test "should show shoe" do
    get shoe_url(@shoe)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoe_url(@shoe)
    assert_response :success
  end

  test "should update shoe" do
    patch shoe_url(@shoe), params: { shoe: { brand_id: @shoe.brand_id, description: @shoe.description, gender: @shoe.gender, material: @shoe.material, name: @shoe.name, primary_color: @shoe.primary_color, product_image_data: @shoe.product_image_data, product_url: @shoe.product_url, retail_price: @shoe.retail_price, secondary_color: @shoe.secondary_color, type_of: @shoe.type_of, user_id: @shoe.user_id } }
    assert_redirected_to shoe_url(@shoe)
  end

  test "should destroy shoe" do
    assert_difference('Shoe.count', -1) do
      delete shoe_url(@shoe)
    end

    assert_redirected_to shoes_url
  end
end
