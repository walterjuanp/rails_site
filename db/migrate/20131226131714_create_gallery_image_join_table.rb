class CreateGalleryImageJoinTable < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.references  :gallery
      t.references  :image
      t.integer     :position
      
      t.timestamps
    end
  end
end
