class Post < ActiveRecord::Base
  extend FriendlyId
  
  # Post.statuses get all status
  as_enum :status, [:draft, :pending_review, :published], :strings => true
  
  friendly_id :title, :use => :slugged
  
  # 
  # convert_options => large => set the maximium width to 1170 respecting the aspect 
  #                             ratio and crop the heigth if it is larger than 350
  #
  has_attached_file :featured_image, :styles => {:thumb => "100x100#", :large => '' },
  :convert_options => { :large => '-auto-orient -resize "1170>" -crop "x350+0+0" +repage' }

  attr_accessible :body_html, :body_kd, :published_at, :featured_image, :status, :title, :category_id, :tag_names
  attr_accessor :tag_names
  
  belongs_to :category
  has_and_belongs_to_many :tags, :uniq => true, :validate => true
  
  validates :title, :body_kd, :status, :published_at, :slug, :presence => true
  validates :status, :as_enum => true
  validates_attachment :featured_image,
  :content_type => { :content_type => %w"image/jpg image/jpeg image/pjpeg image/gif image/png image/svg+xml image/tiff" },
  :size => { :in => 0..4.megabytes }
  
  before_validation :parse_body_kd_to_html
  before_validation :set_tags_by_tag_names
  
  #
  #
  #
  def tag_selectize_options merge=[]
    array = self.tags.all.map{ |tag| { :text => tag.name, :value => tag.name } }
    self.tag_names.split(',').each{ |tag_name| array << { :text => tag_name, :value => tag_name } }
    array += merge
    array.uniq
  end
  
  def tag_selectize_values
    self.tags.map{ |tag| tag.name }.join(',')
  end

  private
  def parse_body_kd_to_html
    self.body_html = Kramdown::Document.new(self.body_kd, :input => 'kramdown').to_html
  end
  
  def set_tags_by_tag_names
    return if self.tag_names.nil?
    self.tags = []
    self.tag_names.split(',').each do |tag_name|
      self.tags << ( Tag.find_by_name(tag_name) || Tag.new(:name => tag_name) )
    end
  end  
  
end
