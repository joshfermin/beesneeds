class AddBlockIdToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :block_id, :integer
  end
end
