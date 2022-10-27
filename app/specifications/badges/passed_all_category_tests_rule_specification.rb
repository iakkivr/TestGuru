module Badges
  class PassedAllCategoryTestsRuleSpecification < AbstractRuleSpecification

    def satisfies?
      id = @test_passage.test.category_id
      @test_passage.where('passed = ?', true).user.tests.where('category_id = ?', id).count == Test.where('category_id = ?', id).count
    end
  end
end
