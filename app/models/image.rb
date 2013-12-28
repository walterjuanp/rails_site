class Image < ActiveRecord::Base
  STYLES = {:medium => '500x350#', :thumb => "100x100#"}
  
  attr_accessible   :image, :name, :alt
  has_attached_file :image, :styles => STYLES
  
#  has_and_belongs_to_many :galleries, :uniq => true
  has_many :gallery_images, :dependent => :destroy
  has_many :galleries, :through => :gallery_images, :uniq => true
  
  validates_attachment :image, :presence => true,
  :content_type => { :content_type => %w"image/jpg image/jpeg image/pjpeg image/gif image/png image/svg+xml image/tiff" },
  :size => { :in => 0..4.megabytes }
end