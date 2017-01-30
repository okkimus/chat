class User < ActiveRecord::Base
  has_many :messages, dependent: :destroy

  has_many :chatters
  has_many :rooms, through: :chatters

  has_secure_password

  validates :name, uniqueness: true,
            length: { minimum: 3 }
  validates :password, length: { minimum: 5 }
end
