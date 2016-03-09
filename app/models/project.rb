class Project < ActiveRecord::Base
  belongs_to :user
  has_many :proposals, dependent: :destroy
  has_many :hidden_projects, dependent: :destroy

  validates :description, :user_id, :style, :price, presence: true
  monetize :price_cents

  scope :recent, -> { where("projects.created_at > ?", DateTime.now - 7.days) }

  has_attachments :photos, maximum: 5

  def self.proposable
    recent.pending
  end

  def self.pending
    all.reject do |p|
      p.proposals.map(&:validated_at).any?(&:present?)
    end
  end

  def self.not_blacklisted(user)
    Project.proposable - user.hidden_projects.includes(:project).map(&:project)
  end

  def ending_at
    created_at + 7.days
  end


end
