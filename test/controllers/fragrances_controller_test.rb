require 'test_helper'

class FragrancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fragrance = fragrances(:one)
  end

  test "should get index" do
    get fragrances_url
    assert_response :success
  end

  test "should get new" do
    get new_fragrance_url
    assert_response :success
  end

  test "should create fragrance" do
    assert_difference('Fragrance.count') do
      post fragrances_url, params: { fragrance: { accords: @fragrance.accords, base_notes: @fragrance.base_notes, brand_id: @fragrance.brand_id, description: @fragrance.description, gender: @fragrance.gender, ingredients: @fragrance.ingredients, middle_notes: @fragrance.middle_notes, name: @fragrance.name, product_image_data: @fragrance.product_image_data, product_url: @fragrance.product_url, release_date: @fragrance.release_date, retail_price: @fragrance.retail_price, top_notes: @fragrance.top_notes, user_id: @fragrance.user_id } }
    end

    assert_redirected_to fragrance_url(Fragrance.last)
  end

  test "should show fragrance" do
    get fragrance_url(@fragrance)
    assert_response :success
  end

  test "should get edit" do
    get edit_fragrance_url(@fragrance)
    assert_response :success
  end

  test "should update fragrance" do
    patch fragrance_url(@fragrance), params: { fragrance: { accords: @fragrance.accords, base_notes: @fragrance.base_notes, brand_id: @fragrance.brand_id, description: @fragrance.description, gender: @fragrance.gender, ingredients: @fragrance.ingredients, middle_notes: @fragrance.middle_notes, name: @fragrance.name, product_image_data: @fragrance.product_image_data, product_url: @fragrance.product_url, release_date: @fragrance.release_date, retail_price: @fragrance.retail_price, top_notes: @fragrance.top_notes, user_id: @fragrance.user_id } }
    assert_redirected_to fragrance_url(@fragrance)
  end

  test "should destroy fragrance" do
    assert_difference('Fragrance.count', -1) do
      delete fragrance_url(@fragrance)
    end

    assert_redirected_to fragrances_url
  end
end
