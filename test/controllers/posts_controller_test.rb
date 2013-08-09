require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    # @post = posts(:two)
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials("dhhh", "secret")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
