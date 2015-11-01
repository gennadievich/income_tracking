class AddDateToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :date, :date
  end
end
