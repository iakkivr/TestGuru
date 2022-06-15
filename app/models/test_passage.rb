# == Schema Information
#
# Table name: test_passages
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  test_id               :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  current_question_id   :integer
#  correct_answers_count :integer
#  score                 :decimal(, )
#
class TestPassage < ApplicationRecord
  belongs_to :current_question, class_name: 'Question', optional: true

  belongs_to :test
  belongs_to :user

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_answers += 1
    end

    self.current_question = next_question
    save
  end

  private
  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end
