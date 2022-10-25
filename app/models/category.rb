class Category < ApplicationRecord
  default_scope { order(:title) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
