class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :block_number
      t.integer :user_id

      t.timestamps
    end
  end
end
