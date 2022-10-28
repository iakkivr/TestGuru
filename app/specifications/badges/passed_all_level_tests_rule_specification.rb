module Badges
  class PassedAllLevelTestsRuleSpecification < AbstractRuleSpecification
    def satisfies?
      @test_passage.where('passed = ?', true).user.tests.where('level = ?', value).count ==
        Test.where('level = ?', @value).count
    end
  end
end
