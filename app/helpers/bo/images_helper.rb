module Bo::ImagesHelper
  def image_dropdown_styles_button image
    btn = button_tag :class => 'btn btn-default dropdown-toggle', 'data-toggle' => "dropdown" do
      content_tag(:span, nil, :class => "glyphicon glyphicon-paperclip") +
      " " +
      content_tag(:span, nil, :class => 'caret')
    end
    
    links = content_tag :ul, :class => 'dropdown-menu align-left', :role => 'menu' do
      Image::STYLES.each do |key, value|
        concat content_tag(:li, (link_to key, 'javascript:void(0)', :onclick => "window.prompt ('#{tview('copy_to_clipboard')}', '#{path_to_image image.image.url(key)}');"))
      end
    end
    
    content_tag(:div, btn+links, :class => 'btn-group')
  end
end
