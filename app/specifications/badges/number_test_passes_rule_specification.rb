module Badges
  class NumberTestPassesRuleSpecification < AbstractRuleSpecification
    def satisfies?
      @test_passage.attempts == @value.to_i
    end
  end
end
