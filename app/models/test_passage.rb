class TestPassage < ApplicationRecord
  belongs_to :current_question, class_name: 'Question', optional: true

  belongs_to :test
  belongs_to :user

  before_validation :before_validation_set_first_question, on: :create

  SUCCESS_RATIO = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def restart_test
    self.current_question = test.questions.first
    self.score = result
    save!
  end

  def completed?
    current_question.nil?
  end

  def serial_number_question
    "Вопрос #{test.questions.map(&:id).index(current_question.id) + 1} из #{test.questions.count} "
  end

  def result
    (correct_questions.to_f / test.questions.count * 100).round(1)
  end

  def successful?
    result >= SUCCESS_RATIO
  end

  def result_message
    score = result
    successful? ? "Congratulations, your score is #{score}%, great" : "Sorry, you didn't pass. Your score
is #{score}%"
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
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

# == Schema Information
#
# Table name: test_passages
#
#  id                  :integer          not null, primary key
#  user_id             :integer          not null
#  test_id             :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  correct_questions   :integer          default(0)
#  score               :decimal(, )
#
