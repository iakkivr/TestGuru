module TestPassagesHelper

  def serial_number_question(test)
    "Вопрос #{test.questions.map(&:id).index(@test_passage.current_question.id) + 1} из #{test.questions.count} "
  end

  def result(test_passages)
    test_passages.correct_questions / test_passages.test.questions.count * 100
  end

  def result_message(test_passages)
    score = result(test_passages)
    score >= 85 ? "Congratulations, your score is #{score}%, great" : "Sorry, you didn't pass. Your score is #{score}%"
  end
end
