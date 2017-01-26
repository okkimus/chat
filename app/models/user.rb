class User < ActiveRecord::Base
  has_many :messages

  has_many :chatters
  has_many :rooms, through: :chatters
end
