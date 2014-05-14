# User model
class User < ActiveRecord::Base
  has_many :blocks
  has_many :reports, through: :blocks
  has_many :photos

  #validates :first_name, presence: true
  #validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
