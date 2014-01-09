class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string      :title
      t.text        :intro_text
      t.text        :body_kd
      t.text        :body_html
      t.string      :status_cd
      t.datetime    :published_at
      t.attachment  :featured_image
      t.references  :category
      t.references  :gallery

      t.timestamps
    end
    
    add_index :posts, :category_id
    add_index :posts, :gallery_id
  end
end
