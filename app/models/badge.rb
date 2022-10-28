class Badge < ApplicationRecord

  has_many :users, through: :achievements
  has_many :achievements, dependent: :destroy
  validates :rule_type,:rule_value, :title, :description, :url_image, presence: true

end

# == Schema Information
#
# Table name: badges
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  url_image     :string           not null
#  option        :string           default("default")
#  badge_rule_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
