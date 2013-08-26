class Web::Posts::CommentsController < Web::Posts::ApplicationController

  add_breadcrumb :index, :post_comments_path
  http_basic_authenticate_with name: "dhhh", password: "secret", only: :destroy

  def create
    comment = CommentEditType.new(params[:comment])
    comment.post = resource_post
    comment.save
    redirect_to post_path(@post)
  end
  def destroy
    @comment = resource_post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end