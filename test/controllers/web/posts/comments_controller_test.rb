require 'test_helper'

class Web::Posts::CommentsControllerTest < ActionController::TestCase
  setup do
    @post = create :post

    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials("dhhh", "secret")
  end

  test "should create comment" do
    attrs = attributes_for 'post/comment'

    post :create, comment: attrs, post_id: @post
    assert_response :redirect

    created_comment = Post::Comment.where(attrs.extract(:commenter)).first
    assert created_comment

    assert @post.comments.include?(created_comment)
  end

  test "should destroy comment" do
    @comment = create 'post/comment', post: @post

    delete :destroy, id: @comment.id, post_id: @post.id
    assert_response :redirect

    assert !@post.comments.include?(@comment)
  end
end
