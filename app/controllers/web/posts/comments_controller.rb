class Web::Posts::CommentsController < Web::Posts::ApplicationController

  add_breadcrumb :index, :post_comments_path
  http_basic_authenticate_with name: "dhhh", password: "secret", only: :destroy

  def new
    @post = resource_post
    @comment = CommentEditType.new(params.extract(:parent_id))
  end

  def create
    comment = CommentEditType.new(params[:post_comment])
    comment.post = resource_post
    comment.save
    redirect_to post_path(resource_post)
  end
  def destroy
    @comment = resource_post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(resource_post)
  end

end
