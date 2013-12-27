class Bo::Ajax::GalleriesController < Bo::Ajax::BaseController
  
  def image_pos
    gallery = Gallery.find(params[:gallery_id])
    image = Image.find(params[:id])
    
    gallery_image = gallery.gallery_images.where(:image_id => image.id).first
    pos = params[:pos].to_i
    
    if gallery_image.blank? || pos.blank?
      text = ""
      text += "gallery_image is blank" if gallery_image.blank?
      text += ", pos is blank" if pos.blank?
      text += ", gallery is #{gallery.id}"
      text += ", image is #{image.id}"
      
      render :json => { :status => false, :error => text}
    else
      gallery_image.insert_at(pos)
      render :json => { :status => true}
    end
  end
  
end