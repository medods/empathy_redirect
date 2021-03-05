require "test_helper"

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get redirects_index_url
    assert_response :success
  end
end
