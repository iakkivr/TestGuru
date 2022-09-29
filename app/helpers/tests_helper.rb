module TestsHelper

  def pass_button(user, test)
    return t('tests.index.button.restart') if user.test_passages.find_by(test_id: test.id)&.score
    user.tests.include?(test) ? t('tests.index.button.continue') : t('tests.index.button.begin')


  end

end
