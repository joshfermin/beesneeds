class Photo < ActiveRecord::Base
  mount_uploader :image, MiscPhotoUploader
  belongs_to :user
end
