class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  has_attachments :images, maximum: 5
end
