class Bo::GalleriesController < Bo::BaseController
  def index
    @galleries = Gallery.paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    @images = Image.paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
  end
  
  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end
  
  def create
    @gallery = Gallery.new(params[:gallery])
   
    if @gallery.save
      redirect_to [:bo, @gallery], :notice => I18n.tmsg('successfully_created', :model => I18n.tmodel(Gallery))
    else
      render :action => "new" 
    end
  end
  
  def update
    @gallery = Gallery.find(params[:id])
   
    if @gallery.update_attributes(params[:gallery])
      redirect_to [:bo, @gallery], :notice => I18n.tmsg('successfully_updated', :model => I18n.tmodel(Gallery))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
   
    redirect_to bo_galleries_url, :notice => I18n.tmsg('successfully_destroyed', :model => I18n.tmodel(Gallery))
  end
  
  def add_image
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    
    @gallery.images << @image
    redirect_to bo_gallery_url(@gallery, :page => params[:page]), :notice => I18n.tmsg('successfully_added', :model => I18n.tmodel(Image))
  end
  
  def delete_image
    @gallery = params[:gallery_id] ? Gallery.find(params[:gallery_id]) : nil
    @image = Image.find(params[:id])
    
    @gallery.images.delete(@image)
    redirect_to bo_gallery_url(@gallery, :page => params[:page]), :notice => I18n.tmsg('successfully_destroyed', :model => I18n.tmodel(Image))
  end
  
end