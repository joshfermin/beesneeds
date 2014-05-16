class AddBlockNumberToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :block_number, :string
  end
end
