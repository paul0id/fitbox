class Item < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_and_belongs_to_many :fit_boxes

  enum kind: {
    accessoire: 0,
    up: 1,
    down: 2,
    footwear: 3
    }

end
