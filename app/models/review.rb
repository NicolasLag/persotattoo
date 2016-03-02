class Review < ActiveRecord::Base
  belongs_to :proposal

  validates :content, :rating, :proposal_id, presence: true
  validates :proposal_id, uniqueness: true

end
