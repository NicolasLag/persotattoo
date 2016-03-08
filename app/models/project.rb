class Project < ActiveRecord::Base
  belongs_to :user
  has_many :proposals, dependent: :destroy
  has_many :hidden_projects, dependent: :destroy

  validates :description, :user_id, :style, :price, presence: true
  monetize :price_cents

  scope :pending, -> { joins(:proposals).where("proposals.validated_at IS NULL").uniq! }
  scope :pending1, -> { where('id NOT IN (SELECT DISTINCT(project_id) FROM proposals)') }
  scope :recent, -> { where("projects.created_at > ?", DateTime.now - 7.days) }

  has_attachments :photos, maximum: 5

  def self.proposable
    (recent.pending + recent.pending1).uniq
  end

  def self.not_blacklisted(user)
    Project.proposable - user.hidden_projects.includes(:project).map(&:project)
  end

  def ending_at
    created_at + 7.days
  end

end
