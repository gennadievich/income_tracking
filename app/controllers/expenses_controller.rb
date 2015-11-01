class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.order('date desc')
  end
  
  def new
    @expense = Expense.new
    @categories = Category.all.map(&:name)
  end
  
  def create
    unless params[:expense][:category].empty?
      @category = current_user.categories.where(name: params[:expense][:category].upcase ).first_or_create
      current_user.categories << @category
    
      @expense = Expense.new(expense_params)
      @expense.category = @category
    
      if @expense.save
        current_user.expenses << @expense
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
    @category = current_user.categories.where(name: params[:expense][:category][:name].upcase).first_or_create
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
