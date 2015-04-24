require 'active_record'
# require 'sqlite3'
require_relative './app/models/report.rb'
require_relative './app/models/block.rb'

ActiveRecord::Base.establish_connection(
    :adapter  => 	'postgresql',
	:encoding => 	'utf8',
	:database =>	'rails_beesneeds_production',
	:username =>	'beesneeds',
	:password => 	'Ieku2un1'
)

startDate = Date.parse('April 1 2015')
endDate = Date.parse('April 7 2015').end_of_day

reports = Report.where(:created_at => startDate..endDate);
# reports = Report.all
# blocks = Block.all

for report in reports
	block = Block.find_by(:block_number => report.block_number)
	report.update(:block_id => block.id)
	puts report.inspect
end


#<Report id: 68, activity: "Other", block_id: 4, comment: "", date: "2015-04-20", image: nil, plug_state: "", plug_type: "", pluga: "", plugn: nil, created_at: "2015-04-20 04:54:51", updated_at: "2015-04-20 04:54:51", block_number: "112344", plug_placement: "", image_subject: "">
#<Report id: 69, activity: "Change", block_id: 4, comment: "", date: "2015-04-23", image: nil, plug_state: "", plug_type: "", pluga: "", plugn: nil, created_at: "2015-04-23 18:02:10", updated_at: "2015-04-23 18:02:10", block_number: "112344", plug_placement: "", image_subject: "">
#<Report id: 70, activity: "Other", block_id: 4, comment: "", date: "2015-04-23", image: nil, plug_state: "", plug_type: "", pluga: "", plugn: nil, created_at: "2015-04-23 18:02:19", updated_at: "2015-04-23 18:02:19", block_number: "153333", plug_placement: "", image_subject: "">
#<Report id: 71, activity: "Change", block_id: 12, comment: "", date: "2015-04-23", image: nil, plug_state: "", plug_type: "", pluga: "", plugn: nil, created_at: "2015-04-23 19:20:27", updated_at: "2015-04-23 19:20:27", block_number: "153084", plug_placement: "", image_subject: "">
#<Report id: 72, activity: "Misc", block_id: 12, comment: "", date: "2015-04-23", image: nil, plug_state: "", plug_type: "", pluga: "", plugn: nil, created_at: "2015-04-23 19:20:35", updated_at: "2015-04-23 19:20:35", block_number: "153084", plug_placement: "", image_subject: "">