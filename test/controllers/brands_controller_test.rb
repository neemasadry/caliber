require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brand = brands(:one)
  end

  test "should get index" do
    get brands_url
    assert_response :success
  end

  test "should get new" do
    get new_brand_url
    assert_response :success
  end

  test "should create brand" do
    assert_difference('Brand.count') do
      post brands_url, params: { brand: { about: @brand.about, account_id: @brand.account_id, address1: @brand.address1, address2: @brand.address2, alias: @brand.alias, brand_image_data: @brand.brand_image_data, category: @brand.category, city: @brand.city, country_code: @brand.country_code, email: @brand.email, facebook_link: @brand.facebook_link, founding_date: @brand.founding_date, homepage_link: @brand.homepage_link, instagram_link: @brand.instagram_link, mission: @brand.mission, name: @brand.name, phone: @brand.phone, pinterest_link: @brand.pinterest_link, price_range: @brand.price_range, slug: @brand.slug, snapchat_link: @brand.snapchat_link, state_code: @brand.state_code, story: @brand.story, tiktok_link: @brand.tiktok_link, twitter_link: @brand.twitter_link, user_id: @brand.user_id, youtube_link: @brand.youtube_link, zipcode: @brand.zipcode } }
    end

    assert_redirected_to brand_url(Brand.last)
  end

  test "should show brand" do
    get brand_url(@brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_brand_url(@brand)
    assert_response :success
  end

  test "should update brand" do
    patch brand_url(@brand), params: { brand: { about: @brand.about, account_id: @brand.account_id, address1: @brand.address1, address2: @brand.address2, alias: @brand.alias, brand_image_data: @brand.brand_image_data, category: @brand.category, city: @brand.city, country_code: @brand.country_code, email: @brand.email, facebook_link: @brand.facebook_link, founding_date: @brand.founding_date, homepage_link: @brand.homepage_link, instagram_link: @brand.instagram_link, mission: @brand.mission, name: @brand.name, phone: @brand.phone, pinterest_link: @brand.pinterest_link, price_range: @brand.price_range, slug: @brand.slug, snapchat_link: @brand.snapchat_link, state_code: @brand.state_code, story: @brand.story, tiktok_link: @brand.tiktok_link, twitter_link: @brand.twitter_link, user_id: @brand.user_id, youtube_link: @brand.youtube_link, zipcode: @brand.zipcode } }
    assert_redirected_to brand_url(@brand)
  end

  test "should destroy brand" do
    assert_difference('Brand.count', -1) do
      delete brand_url(@brand)
    end

    assert_redirected_to brands_url
  end
end
