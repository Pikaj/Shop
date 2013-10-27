class Admin::ProductsController < AdminController

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end
 
  def create
    @product = Product.new(params[:product].permit(:name, :info, :price, :category_id))
 
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end
 
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
 
    if @product.update(params[:product].permit(:name, :info, :price, :category_id))
      redirect_to admin_product_path(@product)
    else
      render 'edit'
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to admin_products_path
  end

	private
  	
  def product_params
    params.require(:product).permit(:name, :info, :price, :category_id)
  end

end
