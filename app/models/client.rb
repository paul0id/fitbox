class Client < User
  belongs_to :manager, foreign_key: :manager_id
  has_many :fit_boxes
end