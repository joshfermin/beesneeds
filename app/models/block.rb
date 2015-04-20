# Block model
class Block < ActiveRecord::Base
	has_many :reports
	belongs_to :user
	validates_uniqueness_of :block_number
	has_one :info
	validates :nickname, :presence => true
	validates_format_of :block_number, with: /((\A153...\z)|(\A555555\z))/, :message => "invalid--please try again and note that you may not register blocks from previous seasons of The Bees' Needs. If you're trying to report an observation on a bee block from 2013 or 2014, please use the Submit Photo option." 

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << ["Block Number", "First Name", "Last Name", "Email"]
			all.each do |block|
				csv << [block.block_number] + [block.user.first_name] + [block.user.last_name] + [block.user.email]
			end
		end
	end
end