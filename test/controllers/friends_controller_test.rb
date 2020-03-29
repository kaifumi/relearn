require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get friends_search_url
    assert_response :success
  end

  test "should get request" do
    get friends_request_url
    assert_response :success
  end

  test "should get index" do
    get friends_index_url
    assert_response :success
  end

end
