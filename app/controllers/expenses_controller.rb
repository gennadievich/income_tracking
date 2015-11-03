class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.order('date desc')
  end
  
  def new
    @expense = Expense.new
    @categories = Category.categories_names
  end
  
  def create
    if params[:expense][:category].present?
      @category = current_user.build_category_if_not_exists(params[:expense][:category])
          
      @expense = current_user.expenses.build(expense_params)
      @expense.category = @category
    
      if @expense.save
        redirect_to expenses_path
      else
        render :new
      end
    else
      render :new
    end
  end
  
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    
    redirect_to expenses_path
  end
  
  def edit
    @expense = Expense.find(params[:id])
  end
  
  def update
    @expense = Expense.find(params[:id])
    @category = current_user.build_category_if_not_exists(params[:expense][:category][:name])
    @expense.category = @category
    
    if @expense.update(expense_params)
      redirect_to expenses_path
    else
      render :edit
    end
  end
  
  private
  
  def expense_params
    params.require(:expense).permit(:sum, :date)
  end
end
