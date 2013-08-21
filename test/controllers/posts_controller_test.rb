require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:two) #FIXME use factory girl
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials("dhhh", "secret")
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should edit post" do
    get :edit, id: @post.id
    assert_response :success
  end

  test "should create post" do
    attrs = { title: 'Some title' }
    post :create, post: attrs
    assert_response :redirect
    created_post = Post.find_by_title(attrs[:title])
    assert created_post
  end

  test "should show post" do
    get :show, id: @post.id
    assert_response :success
  end

  test "should update post" do
    attrs = { title: 'Update title', state_event: 'publish' }
    patch :update, id: @post.id, post: attrs
    assert_response :redirect
    updated_post = Post.find_by_title(attrs[:title])
    assert updated_post
    assert updated_post.published?
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.id
    end

    assert_redirected_to posts_path
  end
end
