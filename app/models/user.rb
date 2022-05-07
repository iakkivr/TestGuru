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
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :tests_passages, dependent: :destroy
  has_many :tests, through: :tests_users

  def tests_by_user(level)
    tests.where(level: level)
  end
end

