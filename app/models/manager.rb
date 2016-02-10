class Manager < User
  has_many :clients
  has_many :fit_boxes  
end