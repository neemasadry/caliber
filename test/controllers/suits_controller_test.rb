require 'test_helper'

class SuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suit = suits(:one)
  end

  test "should get index" do
    get suits_url
    assert_response :success
  end

  test "should get new" do
    get new_suit_url
    assert_response :success
  end

  test "should create suit" do
    assert_difference('Suit.count') do
      post suits_url, params: { suit: { account_id: @suit.account_id, bottom_id: @suit.bottom_id, brand_id: @suit.brand_id, description: @suit.description, gender: @suit.gender, jacket_breasted_style: @suit.jacket_breasted_style, jacket_lapel_style: @suit.jacket_lapel_style, jacket_number_of_buttons: @suit.jacket_number_of_buttons, jacket_pocket_style: @suit.jacket_pocket_style, jacket_sleeve_buttons: @suit.jacket_sleeve_buttons, jacket_ticket_pocket: @suit.jacket_ticket_pocket, jacket_vents_style: @suit.jacket_vents_style, materials: @suit.materials, name: @suit.name, primary_color: @suit.primary_color, product_url: @suit.product_url, retail_price: @suit.retail_price, secondary_color: @suit.secondary_color, top_id: @suit.top_id, trouser_cuff: @suit.trouser_cuff, trouser_pleats: @suit.trouser_pleats, trouser_waistband_style: @suit.trouser_waistband_style, user_id: @suit.user_id } }
    end

    assert_redirected_to suit_url(Suit.last)
  end

  test "should show suit" do
    get suit_url(@suit)
    assert_response :success
  end

  test "should get edit" do
    get edit_suit_url(@suit)
    assert_response :success
  end

  test "should update suit" do
    patch suit_url(@suit), params: { suit: { account_id: @suit.account_id, bottom_id: @suit.bottom_id, brand_id: @suit.brand_id, description: @suit.description, gender: @suit.gender, jacket_breasted_style: @suit.jacket_breasted_style, jacket_lapel_style: @suit.jacket_lapel_style, jacket_number_of_buttons: @suit.jacket_number_of_buttons, jacket_pocket_style: @suit.jacket_pocket_style, jacket_sleeve_buttons: @suit.jacket_sleeve_buttons, jacket_ticket_pocket: @suit.jacket_ticket_pocket, jacket_vents_style: @suit.jacket_vents_style, materials: @suit.materials, name: @suit.name, primary_color: @suit.primary_color, product_url: @suit.product_url, retail_price: @suit.retail_price, secondary_color: @suit.secondary_color, top_id: @suit.top_id, trouser_cuff: @suit.trouser_cuff, trouser_pleats: @suit.trouser_pleats, trouser_waistband_style: @suit.trouser_waistband_style, user_id: @suit.user_id } }
    assert_redirected_to suit_url(@suit)
  end

  test "should destroy suit" do
    assert_difference('Suit.count', -1) do
      delete suit_url(@suit)
    end

    assert_redirected_to suits_url
  end
end
