class AddImageSubjectToReports < ActiveRecord::Migration
  def change
    add_column :reports, :image_subject, :string
  end
end
