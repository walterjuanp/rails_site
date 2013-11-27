class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :title
      t.text      :body_kd
      t.text      :body_html
      t.string    :status_cd
      t.datetime  :published_at

      t.timestamps
    end
  end
end
