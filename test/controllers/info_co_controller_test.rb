require 'test_helper'

class InfoCoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get info_co_new_url
    assert_response :success
  end

end
