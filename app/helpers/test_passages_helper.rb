module TestPassagesHelper

  def serial_number_question(test)
    "Вопрос #{test.questions.map(&:id).index(@test_passage.current_question.id) + 1} из #{test.questions.count} "
  end

end
