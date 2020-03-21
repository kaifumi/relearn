require 'test_helper'

class PlanTimingsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get plan_timings_edit_url
    assert_response :success
  end

end
