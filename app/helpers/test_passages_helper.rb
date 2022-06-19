module TestPassagesHelper
  SUCCESS_RATIO = 85
  def serial_number_question(test)
    "Вопрос #{test.questions.map(&:id).index(@test_passage.current_question.id) + 1} из #{test.questions.count} "
  end

  def result(test_passages)
    (test_passages.correct_questions.to_f / test_passages.test.questions.count * 100).round(1)
  end

  def result_message(test_passages)
    score = result(test_passages)
    score >= SUCCESS_RATIO ? "Congratulations, your score is #{score}%, great" : "Sorry, you didn't pass. Your score is #{score}%"
  end
end
