class Category < ActiveRecord::Base
  has_many :incomes
  has_many :expenses
  
  validates_presence_of :name

  def name=(s)
    write_attribute(:name, s.upcase)
  end
end
