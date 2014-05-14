class Photo < ActiveRecord::Base
  mount_uploader :image, PictureUploader
end
