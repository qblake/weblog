require 'test_helper'

class Web::PostsControllerTest < ActionController::TestCase
  setup do
    @attrs = attributes_for :post
    @post = create :post

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
    post :create, post: @attrs
    assert_response :redirect

    created_post = Post.where(@attrs.extract(:title)).first
    assert { created_post }
  end

  test "should show post" do
    get :show, id: @post.id
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post.id, post: @attrs
    assert_response :redirect

    @post.reload

    assert { @attrs[:title] == @post.title }
  end

  test "should destroy post" do
    delete :destroy, id: @post.id
    assert_response :redirect

    assert { !Post.exists?(@post) }
  end
end
