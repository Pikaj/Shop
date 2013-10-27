class CategoriesController < ApplicationController



	def index
    @categories = Category.all
    @category = Category.new
  end

  def show
  	@category = Category.find(params[:id])
	end

  private
  	
  def category_params
    params.require(:category).permit(:category)
  end
  
end
