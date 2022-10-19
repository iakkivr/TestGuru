class Feedback < ApplicationRecord

  validates :email, presence: true, length: { maximum: 100},
            format: {with: URI::MailTo::EMAIL_REGEXP, message: "Wrong email"}
  validates :body, presence: true

end
