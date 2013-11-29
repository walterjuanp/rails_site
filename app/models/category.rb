require 'slug'
require 'slug_validator'

class Category < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  
  has_many :posts
  
  validates :name, :slug, :presence => true
  validates :name, :slug, :uniqueness => true
  validates :slug, :slug => true
  
  before_validation :set_slug
  
  #
  #
  #
  def self.to_selectize_options
    Category.all.map{ |category| { :text => category.name, :value => category.name } }
  end
  
  private
  def set_slug
    self.slug = Slug.convert(self.name) if self.slug.blank?
  end
end
