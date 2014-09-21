class Web::Posts::ApplicationController < Web::ApplicationController
  private
  def resource_post
    Post.web.find(params[:post_id])
  end
end
