module Badges
  class PassedAllLevelTestsRuleSpecification < AbstractRuleSpecification
    def satisfies?
      @test_passage.user.tests.join(:test_passages)
                   .where(level: value)
                   .where('test_passages.passed = ?', true)
                   .count == Test.where('level = ?', @value).count
    end
  end
end
