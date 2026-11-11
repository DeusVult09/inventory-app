class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  normalizes :email, with: -> email { email.strip.downcase }
  validates :provider, presence: true
  validates :uid, presence: true
  
  enum :status, { active: "active", blocked: "blocked" }, validate: true
end
