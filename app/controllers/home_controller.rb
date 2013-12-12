class HomeController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).order('published_at DESC')
  end
end
