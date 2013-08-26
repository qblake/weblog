class Web::ApplicationController < ApplicationController

  private
  def resource_post
    Post.find(params[:id])
  end

end
