class Category < ActiveRecord::Base
  extend FriendlyId
  
  friendly_id :name, :use => :slugged
  
  attr_accessible :description, :name
  
  has_many :posts
  
  validates :name, :slug, :presence => true
  validates :name, :uniqueness => true

  #
  #
  #
  def self.to_selectize_options
    Category.all.map{ |category| { :text => category.name, :value => category.name } }
  end
  
end
