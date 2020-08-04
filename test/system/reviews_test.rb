require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "creating a Review" do
    visit reviews_url
    click_on "New Review"

    fill_in "Compliment", with: @review.compliment
    fill_in "Quality", with: @review.quality
    fill_in "Ratings", with: @review.ratings
    fill_in "Reviewable", with: @review.reviewable_id
    fill_in "Reviewable type", with: @review.reviewable_type
    fill_in "Title", with: @review.title
    fill_in "User", with: @review.user_id
    fill_in "Value", with: @review.value
    click_on "Create Review"

    assert_text "Review was successfully created"
    assert_selector "h1", text: "Reviews"
  end

  test "updating a Review" do
    visit review_url(@review)
    click_on "Edit", match: :first

    fill_in "Compliment", with: @review.compliment
    fill_in "Quality", with: @review.quality
    fill_in "Ratings", with: @review.ratings
    fill_in "Reviewable", with: @review.reviewable_id
    fill_in "Reviewable type", with: @review.reviewable_type
    fill_in "Title", with: @review.title
    fill_in "User", with: @review.user_id
    fill_in "Value", with: @review.value
    click_on "Update Review"

    assert_text "Review was successfully updated"
    assert_selector "h1", text: "Reviews"
  end

  test "destroying a Review" do
    visit edit_review_url(@review)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Review was successfully destroyed"
  end
end
