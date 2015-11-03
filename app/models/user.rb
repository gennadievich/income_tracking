class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable
  
  has_many :expenses,   dependent: :destroy
  has_many :incomes,    dependent: :destroy
  has_many :categories, dependent: :destroy
  
  def add_category(category)
    categories << category
  end
  
  def build_category_if_not_exists(name)
    categories.where(name: name.upcase).first_or_create
  end
  
  def filter_incomes(category_id, start_date, end_date)
    if category_id.present?
      incomes.where("category_id = ? and date >= ? and date <= ?", category_id, start_date, end_date)
    else
      incomes.where("date >= ? and date <= ?", start_date, end_date)
    end
  end
  
  def filter_expenses(category_id, start_date, end_date)
    if category_id.present?
      expenses.where("category_id = ? and date >= ? and date <= ?", category_id, start_date, end_date)
    else
      expenses.where("date >= ? and date <= ?", start_date, end_date)
    end
  end
end
