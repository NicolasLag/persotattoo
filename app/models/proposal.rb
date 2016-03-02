class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_one :review, dependent: :destroy

  validates :user_id, :project_id, presence: true

end
