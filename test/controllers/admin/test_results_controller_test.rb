require "test_helper"

class Admin::TestResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_test_result = admin_test_results(:one)
  end

  test "should get index" do
    get admin_test_results_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_test_result_url
    assert_response :success
  end

  test "should create admin_test_result" do
    assert_difference("Admin::TestResult.count") do
      post admin_test_results_url, params: { admin_test_result: { choleric: @admin_test_result.choleric, melancholic: @admin_test_result.melancholic, name: @admin_test_result.name, phlegmatic: @admin_test_result.phlegmatic, sanguine: @admin_test_result.sanguine } }
    end

    assert_redirected_to admin_test_result_url(Admin::TestResult.last)
  end

  test "should show admin_test_result" do
    get admin_test_result_url(@admin_test_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_test_result_url(@admin_test_result)
    assert_response :success
  end

  test "should update admin_test_result" do
    patch admin_test_result_url(@admin_test_result), params: { admin_test_result: { choleric: @admin_test_result.choleric, melancholic: @admin_test_result.melancholic, name: @admin_test_result.name, phlegmatic: @admin_test_result.phlegmatic, sanguine: @admin_test_result.sanguine } }
    assert_redirected_to admin_test_result_url(@admin_test_result)
  end

  test "should destroy admin_test_result" do
    assert_difference("Admin::TestResult.count", -1) do
      delete admin_test_result_url(@admin_test_result)
    end

    assert_redirected_to admin_test_results_url
  end
end
