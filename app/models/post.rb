class Post < ActiveRecord::Base
  # Post.statuses get all status
  as_enum :status, [:published, :pending_review, :draft], :strings => true
  
  attr_accessible :body_html, :body_md, :published_at, :status, :title
  
  validates :title, :body_md, :status, :presence => true
  validates :status, :as_enum => true
  
  before_validation :parse_body_md_to_html
  
  private
  def parse_body_md_to_html
    self.body_html = Kramdown::Document.new(self.body_md, :input => 'kramdown').to_html
  end
end
