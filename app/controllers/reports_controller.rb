class ReportsController < ApplicationController
  def new; end
  
  def report
      start_date  = params[:start_date].present? ? params[:start_date] : (Time.now - 1.year)
      end_date    = params[:end_date].present? ? params[:end_date] : Time.now
      category_id = params[:category]
          
      if category_id.present?
        @incomes  = current_user.incomes.where("category_id = ? and date >= ? and date <= ?", category_id, start_date, end_date)
        @expenses = current_user.expenses.where("category_id = ? and date >= ? and date <= ?", category_id, start_date, end_date)
      else
        @incomes  = current_user.incomes.where("date >= ? and date <= ?", start_date, end_date)
        @expenses = current_user.expenses.where("date >= ? and date <= ?", start_date, end_date)
      end
      @incomes_sum  = @incomes.sum(:sum)
      @expenses_sum = @expenses.sum(:sum)
      @balance      = @incomes_sum - @expenses_sum
      @report_data  = (@incomes + @expenses).sort_by { |el| el.date}.reverse!
  end
end
