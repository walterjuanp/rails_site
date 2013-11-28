require 'slug'
require 'slug_validator'

class Tag < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  
  validates :name, :slug, :presence => true
  validates :name, :slug, :uniqueness => true
  validates :slug, :slug => true
  
  before_validation :set_slug
  
  private
  def set_slug
    self.slug = Slug.convert(self.name) if self.slug.blank?
  end
end
