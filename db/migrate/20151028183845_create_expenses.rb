class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :sum
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
