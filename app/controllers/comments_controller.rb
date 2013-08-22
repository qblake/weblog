class CommentsController < ApplicationController

  add_breadcrumb :index, :post_comments_path
  http_basic_authenticate_with name: "dhhh", password: "secret", only: :destroy

  def create
    @post = resource_post
    comment = CommentEditType.new(params[:comment])
    comment.post = @post
    comment.save
    redirect_to post_path(@post)
  end
  def destroy
    @post = resource_post
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def resource_post
    Post.web.find(params[:post_id])
  end
end
