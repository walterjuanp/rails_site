module PostsHelper
  ###############################################
  # HTML
  ###############################################
  #
  #
  #
  def date_icon_and_text post
    date = l post.published_at, :format => :short_2
    "<p class='icon-and-text'><span class='glyphicon glyphicon-calendar icon'></span><span>#{date}</span></p>".html_safe
  end

  #
  #
  #
  def category_icon_and_text post
    link = if post.category.blank? 
      tview('uncategorized')
    else
      link_to post.category.name, search_path(:category => post.category)
    end
    "<p class='icon-and-text'><span class='glyphicon glyphicon-folder-open icon'></span><span>#{link}</span></p>".html_safe
  end
  #
  # Return the icon with text Tag or Tags
  #
  def tag_icon_and_text post
    icon = post.tags.length <= 1 ? 'glyphicon-tag' : 'glyphicon-tags'
    "<p class='icon-and-text'><span class='glyphicon #{icon} icon'></span><span>#{pluralize(post.tags.length, I18n.tmodel(Tag))}</span></p>".html_safe
  end
  
  #
  # Return the button links for tags
  #
  def tag_buttons post
    return '' if post.tags.blank?
    
    html = ''
    for tag in post.tags
      html += link_to tag.name, search_path(:tags => tag), :class => 'button'
    end
    
    return html.html_safe
  end
end
