require "test_helper"

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get upload_view_url
    assert_response :success
  end
end
