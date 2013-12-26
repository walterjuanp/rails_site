class CreateGalleryImageJoinTable < ActiveRecord::Migration
  def change
    create_table :galleries_images, :id => false do |t|
      t.integer :gallery_id
      t.integer :image_id
    end
  end
end
