module Bo::PostsHelper
  
  def label_by_post_status status
    label_type = case status
      when :published then 'label-success'
      when :pending_review then 'label-warning'
      when :draft then 'label-default'
      else '' end
    
    "<span class='label #{label_type}'>#{Post.human_enum_name :statuses, status}</span>".html_safe
  end
  
end
