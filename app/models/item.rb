class Item < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_and_belongs_to_many :fit_boxes

  enum kind: {
    "Accessoir" => 0,
    "Up" => 1,
    "Down" => 2,
    "Footwear" => 3
    }

end
