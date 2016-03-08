class Project < ActiveRecord::Base
  belongs_to :user
  has_many :proposals, dependent: :destroy

  has_attachments :photos, maximum: 5
  validates :description, :user_id, :style, presence: true
  monetize :price_cents

end
