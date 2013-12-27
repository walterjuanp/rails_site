class Bo::Ajax::BaseController < Bo::BaseController
  layout false
  
  def kramdown_to_html
    str = params[:str]
    html = Kramdown::Document.new(str, :input => 'kramdown').to_html
    render :text => html
  end
end