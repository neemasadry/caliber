require "application_system_test_case"

class RoutinesTest < ApplicationSystemTestCase
  setup do
    @routine = routines(:one)
  end

  test "visiting the index" do
    visit routines_url
    assert_selector "h1", text: "Routines"
  end

  test "creating a Routine" do
    visit routines_url
    click_on "New Routine"

    fill_in "Account", with: @routine.account_id
    fill_in "Action days", with: @routine.action_days
    fill_in "Brand", with: @routine.brand_id
    fill_in "Description", with: @routine.description
    fill_in "Est time", with: @routine.est_time
    fill_in "Name", with: @routine.name
    fill_in "Total steps", with: @routine.total_steps
    fill_in "User", with: @routine.user_id
    click_on "Create Routine"

    assert_text "Routine was successfully created"
    assert_selector "h1", text: "Routines"
  end

  test "updating a Routine" do
    visit routine_url(@routine)
    click_on "Edit", match: :first

    fill_in "Account", with: @routine.account_id
    fill_in "Action days", with: @routine.action_days
    fill_in "Brand", with: @routine.brand_id
    fill_in "Description", with: @routine.description
    fill_in "Est time", with: @routine.est_time
    fill_in "Name", with: @routine.name
    fill_in "Total steps", with: @routine.total_steps
    fill_in "User", with: @routine.user_id
    click_on "Update Routine"

    assert_text "Routine was successfully updated"
    assert_selector "h1", text: "Routines"
  end

  test "destroying a Routine" do
    visit edit_routine_url(@routine)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Routine was successfully destroyed"
  end
end
