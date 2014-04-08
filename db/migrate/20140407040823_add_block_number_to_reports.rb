class AddBlockNumberToReports < ActiveRecord::Migration
  def change
    add_column :reports, :block_number, :string
  end
end
