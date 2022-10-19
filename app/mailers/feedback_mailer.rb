class FeedbackMailer < ApplicationMailer
  def feedback_created(feedback)
    @email = feedback.email
    @body = feedback.body

    Admin.all.pluck(:email).each do |admin|
      mail( to: admin,subject: 'Feedback') #Admin.all.pluck(:email)
    end
  end
end
