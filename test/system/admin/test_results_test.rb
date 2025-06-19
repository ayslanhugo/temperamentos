require "application_system_test_case"

class Admin::TestResultsTest < ApplicationSystemTestCase
  setup do
    @admin_test_result = admin_test_results(:one)
  end

  test "visiting the index" do
    visit admin_test_results_url
    assert_selector "h1", text: "Test results"
  end

  test "should create test result" do
    visit admin_test_results_url
    click_on "New test result"

    fill_in "Choleric", with: @admin_test_result.choleric
    fill_in "Melancholic", with: @admin_test_result.melancholic
    fill_in "Name", with: @admin_test_result.name
    fill_in "Phlegmatic", with: @admin_test_result.phlegmatic
    fill_in "Sanguine", with: @admin_test_result.sanguine
    click_on "Create Test result"

    assert_text "Test result was successfully created"
    click_on "Back"
  end

  test "should update Test result" do
    visit admin_test_result_url(@admin_test_result)
    click_on "Edit this test result", match: :first

    fill_in "Choleric", with: @admin_test_result.choleric
    fill_in "Melancholic", with: @admin_test_result.melancholic
    fill_in "Name", with: @admin_test_result.name
    fill_in "Phlegmatic", with: @admin_test_result.phlegmatic
    fill_in "Sanguine", with: @admin_test_result.sanguine
    click_on "Update Test result"

    assert_text "Test result was successfully updated"
    click_on "Back"
  end

  test "should destroy Test result" do
    visit admin_test_result_url(@admin_test_result)
    click_on "Destroy this test result", match: :first

    assert_text "Test result was successfully destroyed"
  end
end
