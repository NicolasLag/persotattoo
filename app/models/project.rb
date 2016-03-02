class Project < ActiveRecord::Base
  belongs_to :user
  has_many :proposals, dependent: :destroy

  validates :description, :user_id, :style, :price, presence: true
end
