class Item < ActiveRecord::Base
  has_and_belongs_to_many :fit_boxes
end
