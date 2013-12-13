class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 10).order('published_at DESC')
  end
  def show
    @post = Post.find(params[:id])
  end
end
