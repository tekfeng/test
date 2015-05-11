require 'test_helper'

class BackbonejsControllerTest < ActionController::TestCase
  test "should get app" do
    get :app
    assert_response :success
  end

end
