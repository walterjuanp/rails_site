class Category < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :posts
  
  validates :name, :presence => true
  validates :name, :uniqueness => true

  #
  #
  #
  def self.to_selectize_options
    Category.all.map{ |category| { :text => category.name, :value => category.name } }
  end
  
end
