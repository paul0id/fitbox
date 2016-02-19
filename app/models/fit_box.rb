class FitBox < ActiveRecord::Base
  extend FriendlyId
  belongs_to :manager, foreign_key: :manager_id
  belongs_to :client, foreign_key: :client_id
  has_and_belongs_to_many :items
  friendly_id :slug

  before_save :set_uuid

  def set_uuid
    self.slug = SecureRandom.uuid if self.slug.nil?
  end


  enum status: {
    not_viewed: 0,
    viewed: 1,
    returned: 2,
    accepted: 3,
    rejected: 4
  }

end
