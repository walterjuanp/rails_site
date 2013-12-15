class StaticController < ApplicationController
  def home
    
  end
  
  def about
    
  end
  
  def search
    @category = params[:category]
    @tags = params[:tags]
    
    query = build_search_query @category, @tags
    empty_search = @category.blank? && @tags.blank?
    @posts = empty_search ? [] : Post.joins(:tags).where(query).uniq
  end
  
  private
  def build_search_query category, tags
    query = {:status_cd => Post.status_published}

    query.merge! :category_id => category unless category.blank?
    query.merge! :tags => {:id => tags.split(',')} unless tags.blank?
    
    query
  end
end