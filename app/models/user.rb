class User < ApplicationRecord
  has_many :inventories, foreign_key: "creator_id", dependent: :destroy
  has_many :items, foreign_key: "creator_id", dependent: :nullify
  validates :name, presence: true
  normalizes :email, with: -> email { email.strip.downcase }
  validates :provider, presence: true
  validates :uid, presence: true
  enum :status, { active: "active", blocked: "blocked" }, validate: true
end