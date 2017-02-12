class User < ApplicationRecord
	extend FriendlyId
	  friendly_id :username, use: :slugged

	has_one :user_profile

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9 ]+\Z/i }

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :downcase_username

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def downcase_username
      self.username = username.downcase
    end

end