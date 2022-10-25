# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint           not null, primary key
#  user_id             :integer          not null
#  test_id             :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  correct_questions   :integer          default(0)
#  score               :decimal(, )
#  attempts            :integer          default(0)
#  best_score          :decimal(, )      default(0.0)
#
require 'test_helper'

class TestPassageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
