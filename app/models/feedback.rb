class Feedback < ApplicationRecord

  validates :email, presence: true, length: { maximum: 100},
            format: {with: URI::MailTo::EMAIL_REGEXP, message: "Wrong email"}
  validates :body, presence: true

end

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  body       :string           not null
#  resolved   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
