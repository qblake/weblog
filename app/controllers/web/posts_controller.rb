class Web::PostsController < Web::ApplicationController
  add_breadcrumb :index, :posts_path

  http_basic_authenticate_with name: "dhhh", password: "secret", except: [:index, :show]

  def new
    @post = PostEditType.new
  end

  def create
    # render text: params[:post].inspect
    @post = PostEditType.new(params[:post])
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = resource_post
    @comment = CommentEditType.new()
    add_breadcrumb @post.title, post_path(@post)
  end

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = Post.ransack(query) #FIXME use Post.web.ransack(query)
    @posts = @q.result.page(params[:page])
  end

  def edit
    @post = resource_post
    add_breadcrumb @post.title, post_path(@post)
  end

  def update
    @post = PostEditType.find(params[:id])
    # raise params.inspect
    if @post.update(params[:post])
      redirect_to @post
    else
      # p @post.errors
      render 'edit'
    end
  end

  def destroy
    @post = resource_post
    @post.destroy

    redirect_to posts_path
  end

  private
  def resource_post
    Post.find(params[:id])
  end

end
