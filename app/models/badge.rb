class Badge < ApplicationRecord

  belongs_to :badge_rule

  has_many :users, through: :achievements
  has_many :achievements, dependent: :destroy

  scope :option, -> (option) { where option: option }
  scope :rule, -> (temp) {
    joins(:badge_rule)
      .where(badge_rules: { title: temp })
  }
  scope :option, -> (option) { where option: option }


  def self.rule_title
    Badge.all.joins(:badge_rule).pluck(:title)
  end

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
