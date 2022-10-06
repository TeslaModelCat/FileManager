class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
         
  has_many :files, class_name: "UserFile", foreign_key: "user_id"
  has_many :notifications
end
