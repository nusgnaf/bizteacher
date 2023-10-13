require "test_helper"

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hello_index_url
    assert_response :success
  end

  test "should get about" do
    get hello_about_url
    assert_response :success
  end
end
