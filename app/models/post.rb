class Post < ActiveRecord::Base
  # Post.statuses get all status
  as_enum :status, [:published, :pending_review, :draft], :strings => true
  
  attr_accessible :body_html, :body_md, :published_at, :status, :title
  
  validates :title, :body_md, :status, :presence => true
  validates :status, :as_enum => true
end
