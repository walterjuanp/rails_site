class Bo::TagsController < Bo::BaseController
  def index
    @tags = Tag.paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(params[:tag])
   
    if @tag.save
      redirect_to [:bo, @tag], :notice => I18n.tmsg('successfully_created', :model => I18n.tmodel(Tag))
    else
      render :action => "new" 
    end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
   
    if @tag.update_attributes(params[:tag])
      redirect_to [:bo, @tag], :notice => I18n.tmsg('successfully_updated', :model => I18n.tmodel(Tag))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
   
    redirect_to bo_tags_url, :notice => I18n.tmsg('successfully_destroyed', :model => I18n.tmodel(Tag))
  end
end
