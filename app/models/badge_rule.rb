
class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
end

# == Schema Information
#
# Table name: badge_rules
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
