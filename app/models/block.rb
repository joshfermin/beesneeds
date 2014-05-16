# Block model
class Block < ActiveRecord::Base
  has_many :reports
  belongs_to :user
  validates_uniqueness_of :block_number
  has_one :info
end