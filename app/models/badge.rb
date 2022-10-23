class Badge < ApplicationRecord

  belongs_to :badge_type

  has_many :users, through: :achievements
  has_many :achievements, dependent: :destroy



end
