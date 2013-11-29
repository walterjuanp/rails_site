class Bo::PostsController < Bo::BaseController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @post.tag_names = @post.tag_selectize_values
  end
  
  def create
    @post = Post.new(params[:post])
   
    if @post.save
      redirect_to [:bo, @post], :notice => I18n.tmsg('successfully_created', :model => I18n.tmodel(Post))
    else
      render :action => "new" 
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @post.tag_names = @post.tag_selectize_values
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to [:bo, @post], :notice => I18n.tmsg('successfully_updated', :model => I18n.tmodel(Post))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    redirect_to bo_posts_url, :notice => I18n.tmsg('successfully_destroyed', :model => I18n.tmodel(Post))
  end
end
