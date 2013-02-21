class Picture < ActiveRecord::Base
  attr_accessible :image,:folder_id
  belongs_to :folder
  mount_uploader :image, ImageUploader
end
