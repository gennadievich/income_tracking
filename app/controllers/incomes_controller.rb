class IncomesController < ApplicationController
  def index
    @incomes = current_user.incomes.order('date desc')
  end

  def new
    @income = Income.new
    @categories = Category.all.map(&:name)
  end

  def create
    unless params[:income][:category].empty?
      @category = current_user.categories.where(name: params[:income][:category].upcase ).first_or_create
      current_user.categories << @category

      @income = Income.new(income_params)
      @income.category = @category

      if @income.save
        current_user.incomes << @income
        redirect_to incomes_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to incomes_path
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    @category = current_user.categories.where(name: params[:income][:category][:name].upcase).first_or_create
    @income.category = @category

    if @income.update(income_params)
      redirect_to incomes_path
    else
      render :edit
    end
  end

  private

  def income_params
    params.require(:income).permit(:sum, :date)
  end
end
