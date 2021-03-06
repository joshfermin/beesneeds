# Report model
class Report < ActiveRecord::Base
  belongs_to :block
  belongs_to :user
  mount_uploader :image, PictureUploader
  validates_presence_of :block_number
  validates :date, :presence => true
  validates :activity, :presence => true
  validates_presence_of :image, :presence => true, :if => :image_subject?

  attr_writer :current_step

 def current_step
  @current_step || steps.first
 end


 def self.to_csv(options = {})
  CSV.generate(options) do |csv|
  	csv << column_names
  	all.each do |report|
  		csv << report.attributes.values_at(*column_names)
  	end
  end
 end


 def steps
  %w[first second]
 end

 def next_step
  self.current_step = steps[steps.index(current_step) + 1]
 end

 def previous_step
  self.current_step = steps[steps.index(current_step) - 1]
 end

 def first_page?
   current_step == steps.first
 end

 def last_page?
  current_step == steps.last
 end


end
