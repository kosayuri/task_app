require "test_helper"

class HistroysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get histroys_create_url
    assert_response :success
  end
end
