class Tag < ActiveRecord::Base
  extend FriendlyId
  
  friendly_id :name, :use => :slugged
  
  attr_accessible :description, :name
  
  has_and_belongs_to_many :posts, :uniq => true, :readonly => true
  
  validates :name, :slug, :presence => true
  validates :name, :uniqueness => true
  
  #
  #
  #
  def self.to_selectize_options use_id=false
    Tag.all.map{ |tag| { :text => tag.name, :value => (use_id ? tag.id : tag.name) } }
  end
  
end