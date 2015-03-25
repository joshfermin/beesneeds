# Block model
class Block < ActiveRecord::Base
	has_many :reports
	belongs_to :user
	validates_uniqueness_of :block_number
	has_one :info

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << ["Block Number", "First Name", "Last Name", "Email"]
			all.each do |block|
				csv << [block.block_number] + [block.user.first_name] + [block.user.last_name] + [block.user.email]
			end
		end
	end
end