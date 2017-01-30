class Message < ActiveRecord::Base
  belongs_to :user

  belongs_to :room

  validates :room_id, presence: true
end
