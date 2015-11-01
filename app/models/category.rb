class Category < ActiveRecord::Base
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
  
  validates_presence_of :name

  def name=(s)
    write_attribute(:name, s.upcase)
  end
end
