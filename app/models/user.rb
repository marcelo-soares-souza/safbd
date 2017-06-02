class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :fullname, use: :slugged

  validates :fullname, presence: true

  def should_generate_new_friendly_id?
    fullname_changed?
  end
end
