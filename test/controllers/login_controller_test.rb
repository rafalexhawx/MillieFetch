require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get login_view_url
    assert_response :success
  end
end
