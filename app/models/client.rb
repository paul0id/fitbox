class Client < User

  validates :first_name, :last_name, :type, :avatar, :sport, :where,
            :body, :up_size, :down_size, :foot_size, :address, :phone, :city, :country, :zip, presence: true
  belongs_to :manager, foreign_key: :manager_id
  has_many :fit_boxes
end