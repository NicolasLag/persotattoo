class Proposal < ActiveRecord::Base

  has_attachments :photos, maximum: 5
  belongs_to :user
  belongs_to :project
  has_one :review, dependent: :destroy

  validates :user_id, :project_id, presence: true

end
