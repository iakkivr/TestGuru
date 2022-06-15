# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#
class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: { maximum: 100}, uniqueness: { case_sensitive: false },
            format: {with: URI::MailTo::EMAIL_REGEXP, message: "Wrong email"}

  def tests_by_user(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end
end

