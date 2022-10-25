module UserBadgeService
  def check_badges
    Badge.all.each do |badge|
      send((badge.badge_rule.title + '_achievements').to_sym, badge.title, badge.option)
    end
  end

  def award_badge(rule, name, option = 'default')
    Badge.option(option).rule(rule).each do |badge|
      current_user.badges.push(badge)
      flash[:achievement] = name
    end
  end

  def amount_achievements(title, option)
    award_badge('amount', "#{title} #{:amount}", :amount) if current_user
                                                               .count_passed_tests == option.to_i
  end

  def category_achievements(title, option)
    award_badge('category', "#{title}") if  current_user.category_completed?(option)
  end

  #
  def attempts_achievements(title, option)
    create_badge('attempts', "#{title}") if current_user.test_attempts == option
  end

end
