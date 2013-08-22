require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = create :post

    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials("dhhh", "secret")
  end

  test "should create comment" do
    attrs = attributes_for :comment

    post :create, comment: attrs, post_id: @post.id
    assert_response :redirect

    @post.reload

    #TODO разобраться с использованием .extract!()
    created_comment = Comment.where(attrs.extract!(:commenter)).first
    assert created_comment

    assert Comment.exists?(created_comment)
    assert @post.comments.include?(created_comment)
  end

  test "should destroy comment" do
    #TODO убедиться что не overengeneering и нет лишних assert'ов
    @comment = create :comment, post_id: @post.id
    assert @post.comments.include?(@comment)

    delete :destroy, id: @comment.id, post_id: @post.id
    assert_response :redirect

    @post.reload

    assert !Comment.exists?(@comment)
    assert !@post.comments.include?(@comment)
  end
end
