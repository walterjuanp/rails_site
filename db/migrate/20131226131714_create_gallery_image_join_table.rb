class CreateGalleryImageJoinTable < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.references  :gallery
      t.references  :image
      t.integer     :position
      
      t.timestamps
    end
    
    add_index :gallery_images, :image_id
    add_index :gallery_images, :gallery_id
  end
end
