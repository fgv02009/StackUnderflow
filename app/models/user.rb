class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
