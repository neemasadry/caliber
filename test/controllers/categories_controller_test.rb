require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { accessories_count: @category.accessories_count, account_id: @category.account_id, bottoms_count: @category.bottoms_count, brands_count: @category.brands_count, catalogs_count: @category.catalogs_count, category_group_id: @category.category_group_id, cosmetics_count: @category.cosmetics_count, dresses_count: @category.dresses_count, fragrances_count: @category.fragrances_count, guides_count: @category.guides_count, jewelries_count: @category.jewelries_count, name: @category.name, outfits_count: @category.outfits_count, reviews_count: @category.reviews_count, shoes_count: @category.shoes_count, subcategory_count: @category.subcategory_count, suits_count: @category.suits_count, tops_count: @category.tops_count, total_products_count: @category.total_products_count, user_id: @category.user_id } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { accessories_count: @category.accessories_count, account_id: @category.account_id, bottoms_count: @category.bottoms_count, brands_count: @category.brands_count, catalogs_count: @category.catalogs_count, category_group_id: @category.category_group_id, cosmetics_count: @category.cosmetics_count, dresses_count: @category.dresses_count, fragrances_count: @category.fragrances_count, guides_count: @category.guides_count, jewelries_count: @category.jewelries_count, name: @category.name, outfits_count: @category.outfits_count, reviews_count: @category.reviews_count, shoes_count: @category.shoes_count, subcategory_count: @category.subcategory_count, suits_count: @category.suits_count, tops_count: @category.tops_count, total_products_count: @category.total_products_count, user_id: @category.user_id } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
