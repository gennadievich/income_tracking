class CategoriesController < ApplicationController
  
  before_action :check_if_category_exists, only: [:create, :update]
  
  def index
    @categories = current_user.categories.all
  end

  def create
    @category = Category.new(category_params)
      
      if @category.save
        current_user.categories << @category
        redirect_to categories_path
      else
        render :new
      end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
  end

  def update
    @category = Category.find(params[:id])
    
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def check_if_category_exists
    if current_user.categories.find_by(name: params[:category][:name].upcase)
      redirect_to :back
    end
  end
end
