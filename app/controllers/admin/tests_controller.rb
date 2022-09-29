class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show update edit destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def show
    @questions = @test.questions
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end