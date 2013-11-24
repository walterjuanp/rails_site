class Post < ActiveRecord::Base
  attr_accessible :body_html, :body_md, :published_at, :status, :title
end
