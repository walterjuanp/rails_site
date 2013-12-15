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

########################
  def search
    @category = params[:category]
    @tags = params[:tags]
    
    query = build_search_query @category, @tags
    @posts = query.blank? ? [] : Post.joins(:tags).where(query)
  end
  
  private
  def build_search_query category, tags
    query = {}
    
    query.merge! :category_id => category unless category.blank?
    query.merge! :tags => {:id => tags.split(',')} unless tags.blank?
    
    query
  end
  
########################
def search
    @category = params[:category]
    @tags = params[:tags]
    query_st, query_params = build_search_query @category, @tags

    @posts = query_st.blank? ? [] : Post.joins(:tags).where(query_st, query_params).pluck(:id)
  end
  
  private
  def build_search_query category, tags
    query_st = ''
    query_params = {}
    
    unless category.blank?
      query_st += ' category_id=:category'
      query_params.merge! :category => category
    end
    
    unless tags.blank?
      query_st += ' AND tags.tag_id IN :tags'
      query_params.merge! :tags => tags.split(',')
    end
    
    [query_st, query_params]
  end