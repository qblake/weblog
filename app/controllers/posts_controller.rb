class PostsController < ApplicationController
  add_breadcrumb :index, :posts_path

  http_basic_authenticate_with name: "dhhh", password: "secret", except: [:index, :show]

  def new
    @post = PostEditType.new
  end

  def create
    # render text: params[:post].inspect
    @post = Post.new(params[:post].permit(:title, :text))
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    add_breadcrumb @post.title, post_path(@post)
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    add_breadcrumb @post.title, post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    # raise params.inspect
    if @post.update(params[:post].permit(:title, :text, :state_event))
      redirect_to @post
    else
      # p @post.errors
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
