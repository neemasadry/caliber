require 'test_helper'

class OutfitCatalogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outfit_catalog = outfit_catalogs(:one)
  end

  test "should get index" do
    get outfit_catalogs_url
    assert_response :success
  end

  test "should get new" do
    get new_outfit_catalog_url
    assert_response :success
  end

  test "should create outfit_catalog" do
    assert_difference('OutfitCatalog.count') do
      post outfit_catalogs_url, params: { outfit_catalog: { account_id: @outfit_catalog.account_id, brand_id: @outfit_catalog.brand_id, category: @outfit_catalog.category, description: @outfit_catalog.description, title: @outfit_catalog.title, total_number_of_outfits: @outfit_catalog.total_number_of_outfits, total_price: @outfit_catalog.total_price, user_id: @outfit_catalog.user_id } }
    end

    assert_redirected_to outfit_catalog_url(OutfitCatalog.last)
  end

  test "should show outfit_catalog" do
    get outfit_catalog_url(@outfit_catalog)
    assert_response :success
  end

  test "should get edit" do
    get edit_outfit_catalog_url(@outfit_catalog)
    assert_response :success
  end

  test "should update outfit_catalog" do
    patch outfit_catalog_url(@outfit_catalog), params: { outfit_catalog: { account_id: @outfit_catalog.account_id, brand_id: @outfit_catalog.brand_id, category: @outfit_catalog.category, description: @outfit_catalog.description, title: @outfit_catalog.title, total_number_of_outfits: @outfit_catalog.total_number_of_outfits, total_price: @outfit_catalog.total_price, user_id: @outfit_catalog.user_id } }
    assert_redirected_to outfit_catalog_url(@outfit_catalog)
  end

  test "should destroy outfit_catalog" do
    assert_difference('OutfitCatalog.count', -1) do
      delete outfit_catalog_url(@outfit_catalog)
    end

    assert_redirected_to outfit_catalogs_url
  end
end
