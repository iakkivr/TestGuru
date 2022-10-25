
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements


  validates :email, presence: true, length: { maximum: 100}, uniqueness: { case_sensitive: false },
            format: {with: URI::MailTo::EMAIL_REGEXP, message: "Wrong email"}


  def tests_by_user(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end

  def achievement(badge)
    achievements.find_by(badge_id: badge.id)
  end

  def count_passed_tests
    test_passages.where("best_score > ?", ENV.fetch('SUCCESS_RATIO')).count
  end

  def category_completed?(category)
    tests.joins(:category).where('categories.title' => category).count ==
      Test.all.joins(:category).where('categories.title' => category).count
  end

  def test_attempts(test)
    test
  end
end


# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           default("name"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  type                   :string           default("User"), not null
#  last_name              :string
#
