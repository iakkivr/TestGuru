module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create New answer"
    else
      "Edit answer"
    end
  end
end
