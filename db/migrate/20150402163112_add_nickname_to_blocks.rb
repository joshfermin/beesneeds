class AddNicknameToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :nickname, :string
  end
end
