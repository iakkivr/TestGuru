# == Schema Information
#
# Table name: test_passages
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  test_id               :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  current_question_id   :integer
#  correct_answers_count :integer
#  score                 :decimal(, )
#
require 'test_helper'

class TestPassageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
