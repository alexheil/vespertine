class UserProfile < ApplicationRecord
	belongs_to :user

	validates :user_id, presence: true
	validates :age, length: { is: 2 }, numericality: { less_than_or_equal_to: 99, greater_than_or_equal_to: 18}, allow_blank: true
  validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ][A-Z]/ }, allow_blank: true
  validates :biography, length: { maximum: 14216 }, allow_blank: true
 	validates :theme_color, format: { with: /(#)?[a-f0-9]{6}/i }, allow_blank: true

	before_save :add_pound_to_hex

	protected

	  def add_pound_to_hex
      unless self.theme_color.starts_with?('#')
        self.theme_color = "##{self.theme_color}" unless theme_color.blank?
      end
    end

end
