# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  def tests_by_user(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where({ level: level }).where({ results: { user_id: id } })
  end
end

