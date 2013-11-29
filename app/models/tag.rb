require 'slug'
require 'slug_validator'

class Tag < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  
  has_and_belongs_to_many :posts, :uniq => true, :readonly => true
  
  validates :name, :slug, :presence => true
  validates :name, :slug, :uniqueness => true
  validates :slug, :slug => true
  
  before_validation :set_slug
  
  #
  #
  #
  def self.to_selectize_options
    Tag.all.map{ |tag| { :text => tag.name, :value => tag.name } }
  end
  
  private
  def set_slug
    self.slug = Slug.convert(self.name) if self.slug.blank?
  end
end
