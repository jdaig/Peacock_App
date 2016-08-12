require 'test_helper'

class InfoPerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get info_per_new_url
    assert_response :success
  end

end
