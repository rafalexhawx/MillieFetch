require "test_helper"

class MultiformControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get multiform_index_url
    assert_response :success
  end
end
