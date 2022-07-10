module TestsHelper

  def pass_button(user, test)
    user.tests.include?(test) ? 'Continue' : 'Begin'
  end

end
