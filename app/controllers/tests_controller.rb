class TestsController < ApplicationController
  before_action :set_test, only: %i[show update edit destroy start]
  before_action :set_user, only: %i[start index]
  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user.tests.push(@test) unless @user.tests.include?(@test)
    redirect_to @user.test_passage(@test)
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
