require 'test_helper'

class CompletesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get completes_index_url
    assert_response :success
  end

  test "should get show" do
    get completes_show_url
    assert_response :success
  end

  test "should get update" do
    get completes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get completes_destroy_url
    assert_response :success
  end

end
