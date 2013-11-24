class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :title
      t.text      :body_md
      t.text      :body_html
      t.integer   :status
      t.datetime  :published_at

      t.timestamps
    end
  end
end
