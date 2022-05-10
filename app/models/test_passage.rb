# == Schema Information
#
# Table name: test_passages
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  test_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
