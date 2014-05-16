class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.datetime "created_at"
      t.string :image_subject
      t.string :comment
      t.string :image

      t.timestamps
    end
  end
end
