require 'slug_validator'

class Category < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  
  validates :name, :slug, :presence => true
  validates :slug, :slug => true
end
