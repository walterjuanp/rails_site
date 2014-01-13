class StaticController < ApplicationController
  def search
    @category = params[:category]
    @tags = params[:tags]
    
    @posts = build_search_query @category, @tags
  end
  
  private
  def build_search_query category, tags
    return [] if category.blank? && tags.blank?
    
    query = {:status_cd => Post.status_published}
    query.merge! :category_id => category unless category.blank?
    
    if tags.blank?
      Post.where(query)
      .paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
      .order('published_at DESC')
      .uniq
    else
      query.merge! :tags => {:id => tags.split(',')}
      Post.joins(:tags).where(query)
      .paginate(:page => params[:page], :per_page => ELEMS_PER_PAGE)
      .order('published_at DESC')
      .uniq
    end
  end
end