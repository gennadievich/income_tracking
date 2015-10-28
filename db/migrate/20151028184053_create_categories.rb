class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :income_id
      t.integer :expense_id

      t.timestamps null: false
    end
  end
end
