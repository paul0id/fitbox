class FitBox < ActiveRecord::Base
  belongs_to :manager, foreign_key: :manager_id
  belongs_to :client, foreign_key: :client_id
  has_and_belongs_to_many :items
end
