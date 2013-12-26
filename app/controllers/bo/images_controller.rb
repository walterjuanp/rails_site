class Bo::ImagesController < Bo::BaseController
  def index
    @images = Image.paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
  end
  
  def show
    @image = Image.find(params[:id])
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(params[:image])
    
    if @image.save
      redirect_to [:bo, @image], :notice => I18n.tmsg('successfully_created', :model => I18n.tmodel(Image))
    else
      render :action => "new" 
    end
  end
  
  def edit
    @image = Image.find(params[:id])
  end
  
  def update
    @image = Image.find(params[:id])
   
    if @image.update_attributes(params[:image])
      redirect_to [:bo, @image], :notice => I18n.tmsg('successfully_updated', :model => I18n.tmodel(Image))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @image = Image.find(params[:id])

    @image.destroy
    redirect_to bo_images_url, :notice => I18n.tmsg('successfully_destroyed', :model => I18n.tmodel(Image))
  end
end