class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :activity
      t.integer :block_id
      t.string :comment
      t.date :date
      t.string :image
      t.string :plug_state
      t.string :plug_type
      t.string :pluga
      t.integer :plugn

      t.timestamps
    end
  end
end
