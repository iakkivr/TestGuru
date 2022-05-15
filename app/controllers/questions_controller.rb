class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create destroy new]
  before_action :set_question, only: %i[show destroy]

  def index
    render json: @test.questions
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
    @question = Question.destroy(params[:id])
    redirect_to test_questions_path(@question.test_id)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def check_authorization
    raise User::NotAuthorized unless current_user.admin?
  end

end
