# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :string           not null
#  correct     :boolean          default(FALSE), not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where correct: true }
  validate :wrong_number_of_answers
  validates :body, presence: true

  def wrong_number_of_answers
    errors.add(:answers, "must contain 1 to 4 answers") unless
      question.answers.count.between?(1, 4)
  end
end
