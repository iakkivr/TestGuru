
class TestPassagesController < ApplicationController
  include UserBadgeService

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]
  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_later
      redirect_to result_test_passage_path(@test_passage)
      @test_passage.restart_test
      check_badges
    else
      render :show
    end
  end

  private
  def completed?

  end
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
