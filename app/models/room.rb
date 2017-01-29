class Room < ActiveRecord::Base
  has_many :chatters
  has_many :users, through: :chatters

  has_many :messages, dependent: :destroy
end
