module Badges
  class PassedAllCategoryTestsRuleSpecification < AbstractRuleSpecification

    def satisfies?
      id = @test_passage.test.category_id
      @test_passage.user.tests.joins(:test_passages)
                   .where(category_id: id)
                   .where('test_passages.passed = ?', true)
                   .count == Test.where(category_id: id).count
    end
  end
end

