class Post < ActiveRecord::Base
  # Post.statuses get all status
  as_enum :status, [:draft, :pending_review, :published], :strings => true
  
  attr_accessible :body_html, :body_kd, :published_at, :status, :title
  
  validates :title, :body_kd, :status, :presence => true
  validates :status, :as_enum => true
  
  before_validation :parse_body_kd_to_html
  
  private
  def parse_body_kd_to_html
    self.body_html = Kramdown::Document.new(self.body_kd, :input => 'kramdown').to_html
  end
end
