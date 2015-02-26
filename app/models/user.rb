class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
