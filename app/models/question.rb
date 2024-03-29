class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true, length: {minimum: 5}
end

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  test_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
