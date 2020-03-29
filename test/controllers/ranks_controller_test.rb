require 'test_helper'

class RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get point_rank" do
    get ranks_point_rank_url
    assert_response :success
  end

  test "should get friend_point_rank" do
    get ranks_friend_point_rank_url
    assert_response :success
  end

  test "should get rhythm_rank" do
    get ranks_rhythm_rank_url
    assert_response :success
  end

  test "should get friend_rhythm_rank" do
    get ranks_friend_rhythm_rank_url
    assert_response :success
  end

end
