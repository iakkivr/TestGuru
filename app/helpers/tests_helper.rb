module TestsHelper

  def pass_button(user, test)
    return "Restart" if user.test_passages.find_by(test_id: test.id)&.score
    user.tests.include?(test) ? 'Continue' : 'Begin'


  end

end
