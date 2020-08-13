require 'test_helper'

class OutfitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outfit = outfits(:one)
  end

  test "should get index" do
    get outfits_url
    assert_response :success
  end

  test "should get new" do
    get new_outfit_url
    assert_response :success
  end

  test "should create outfit" do
    assert_difference('Outfit.count') do
      post outfits_url, params: { outfit: { account_id: @outfit.account_id, brand_id: @outfit.brand_id, description: @outfit.description, dress_code: @outfit.dress_code, name: @outfit.name, occasion: @outfit.occasion, total_number_of_products: @outfit.total_number_of_products, total_price: @outfit.total_price, user_id: @outfit.user_id } }
    end

    assert_redirected_to outfit_url(Outfit.last)
  end

  test "should show outfit" do
    get outfit_url(@outfit)
    assert_response :success
  end

  test "should get edit" do
    get edit_outfit_url(@outfit)
    assert_response :success
  end

  test "should update outfit" do
    patch outfit_url(@outfit), params: { outfit: { account_id: @outfit.account_id, brand_id: @outfit.brand_id, description: @outfit.description, dress_code: @outfit.dress_code, name: @outfit.name, occasion: @outfit.occasion, total_number_of_products: @outfit.total_number_of_products, total_price: @outfit.total_price, user_id: @outfit.user_id } }
    assert_redirected_to outfit_url(@outfit)
  end

  test "should destroy outfit" do
    assert_difference('Outfit.count', -1) do
      delete outfit_url(@outfit)
    end

    assert_redirected_to outfits_url
  end
end
