class User < ApplicationRecord
  has_many :orders

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  enum role: ['default']
end
