class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create new]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  def index
    @test.questions
  end

  def show
    render plain: @question.body
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      redirect_to :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test_id)
  end

  private

  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
