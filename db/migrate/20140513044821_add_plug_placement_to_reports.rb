class AddPlugPlacementToReports < ActiveRecord::Migration
  def change
    add_column :reports, :plug_placement, :string
  end
end
