require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get install" do
    get :install
    assert_response :success
  end

  test "should get moderation" do
    get :moderation
    assert_response :success
  end

  test "should get administration" do
    get :administration
    assert_response :success
  end

end
