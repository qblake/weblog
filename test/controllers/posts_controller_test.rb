require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:two)
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

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: {title: 'Some title'}
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post.id
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post.id, post: {}
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.id
    end

    assert_redirected_to posts_path
  end
end
