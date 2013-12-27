class Gallery < ActiveRecord::Base
  attr_accessible :description, :name
  
#  has_and_belongs_to_many :images, :uniq => true
  has_many :gallery_images, :dependent => :destroy
  has_many :images, :through => :gallery_images, :uniq => true, :order => "position ASC"
  
  validates :name, :presence => true
  
  #
  #
  #
  def self.to_selectize_options 
    Gallery.all.map{ |gallery|
      {:id => gallery.id,
      :name => gallery.name,
      :description => gallery.description.blank? ? I18n.tmsg('description_no_available') : gallery.description.truncate(50),
      :thumb => gallery.images.first ? gallery.images.first.image.url(:thumb) : nil,
      :n_images => gallery.images.count}
    }
  end
end