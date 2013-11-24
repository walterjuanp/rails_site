require 'slug_validator'

class Tag < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  
  validates :name, :slug, :presence => true
  validates :slug, :slug => true
end
