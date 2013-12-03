class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string      :name
      t.string      :alt
      t.attachment  :image
    end
  end
end
