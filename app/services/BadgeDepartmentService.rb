class BadgeDepartmentService
  RULES = {
       passed_all_category_tests: Badges::PassedAllCategoryTestsRuleSpecification,
       attempts: Badges::NumberTestPassesRuleSpecification,
       level: Badges::PassedAllLevelTestsRuleSpecification
  }.freeze

  def self.call(test_passage)
    @test_passage = test_passage
    Badge.find_each do |badge|
      # rule = RULES[badge.rule_type].new(badge.rule_value, @test_passage)
      rule = RULES[badge.rule_type.to_sym].new(badge.rule_value, @test_passage)
      # add_badges(badge) if rule.satisfies?
      @test_passage.user.badges << badge if rule.satisfies?
    end
  end

  private

  def add_badges(badge)
    @test_passage.user.badges << badge
  end
end
