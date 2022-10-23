
class BadgeType < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :type, presence: true, length: {maximum: 100}
end
