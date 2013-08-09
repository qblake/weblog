require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:two)
       attrs = { commenter: 'Mr.Somer' }
    post :create, comment: attrs, post_id: @post.id
    assert_response :redirect
    @created_comment = Comment.find_by_commenter(attrs[:commenter])
    @request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::
      Basic.encode_credentials("dhhh", "secret")
  end

  test "should create comment" do
    assert @created_comment
  end

  test "should destroy comment" do
    delete :destroy, id: @created_comment.id, post_id: @post.id
    assert !Comment.exists?(@created_comment)
  end
end
