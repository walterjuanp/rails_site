class GalleryImage < ActiveRecord::Base
  attr_accessible :gallery_id, :image_id, :position
  
  acts_as_list :scope => :gallery
  
  belongs_to :gallery
  belongs_to :image
end