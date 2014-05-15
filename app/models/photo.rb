class Photo < ActiveRecord::Base
  mount_uploader :image, MiscPhotoUploader
  belongs_to :user
  validates :image, :presence => true
  validates :image_subject, :presence => true
end
