class Bo::CategoriesController < Bo::BaseController
  def index
    @categories = Category.paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
   
    if @category.save
      redirect_to [:bo, @category], :notice => I18n.tmsg('successfully_created', :model => I18n.tmodel(Category))
    else
      render :action => "new" 
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
   
    if @category.update_attributes(params[:category])
      redirect_to [:bo, @category], :notice => I18n.tmsg('successfully_updated', :model => I18n.tmodel(Category))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
   
    redirect_to bo_categories_url, :notice => I18n.tmsg('successfully_destroyed', :model => I18n.tmodel(Category))
  end
end
