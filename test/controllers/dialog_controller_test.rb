require 'test_helper'

class DialogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dialog_index_url
    assert_response :success
  end

end
