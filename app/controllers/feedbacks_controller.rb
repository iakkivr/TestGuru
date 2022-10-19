class FeedbacksController < ApplicationController
  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

      if @feedback.save
        FeedbackMailer.feedback_created(@feedback).deliver_now
        redirect_to root_path, notice: "Feedback was successfully created."
      else
        render :new
      end
  end

  private
    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:email, :body)
    end
end
