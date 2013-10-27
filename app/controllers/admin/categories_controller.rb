class Admin::CategoriesController < AdminController

	def new
    @category = Category.new
  end

	def index
    @categories = Category.all
    @category = Category.new
  end

  def show
  	@category = Category.find(params[:id])
	end

  def create
  	@category = Category.new(category_params)
 
  	@category.save
  	redirect_to admin_categories_path

	end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
 
    redirect_to admin_categories_path
  end

  def update
    @category = Category.find(params[:id])
 
    if @category.update(params[:category].permit(:category))
      redirect_to admin_categories_path
    else
      render 'edit'
    end

  end

  private
  	
  def category_params
    params.require(:category).permit(:category)
  end
end
