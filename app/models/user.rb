class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :received_proposals, through: :projects, source: :proposals
  # validates :first_name, :last_name, presence: true
end
