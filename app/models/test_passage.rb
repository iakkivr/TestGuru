class TestPassage < ApplicationRecord
  belongs_to :current_question, class_name: 'Question', optional: true

  belongs_to :test
  belongs_to :user

  before_validation :before_validation_set_parameters, on: :create


  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    self.passed = true if completed? && successful?
    save!
  end

  def restart_test
    self.score = result || 0
    self.current_question = test.questions.first
    self.best_score = [score, best_score.to_f].max
    self.attempts += 1 if self.best_score < ENV.fetch('SUCCESS_RATIO').to_i
    self.correct_questions = 0
    save!
  end

  def completed?
    current_question.nil?
  end

  def serial_number_question
    "Вопрос #{question_number} из #{test.questions.count} "
  end

  def question_number
    test.questions.map(&:id).index(current_question.id) + 1
  end

  def result
    (correct_questions.to_f / test.questions.count * 100).round(1)
  end

  def successful?
    self.score.to_i >= ENV.fetch('SUCCESS_RATIO').to_i && time_is_over?
  end

  def result_message
    successful? ? "Congratulations, your score is #{score}%, great" : "Sorry, you didn't pass. Your score
is #{score}%"
  end

  def time_is_over?
    return false if self.test.time.nil?
    self.test.time < Time.now - self.start_time
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

  def before_validation_set_parameters
    self.current_question = test.questions.first if test.present?
    self.attempts = 1
    self.start_time = Time.now
  end
end

# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint           not null, primary key
#  user_id             :integer          not null
#  test_id             :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  correct_questions   :integer          default(0)
#  score               :decimal(, )
#  attempts            :integer          default(0)
#  best_score          :decimal(, )      default(0.0)
#
