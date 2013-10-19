class ProductsController < ApplicationController
  http_basic_authenticate_with name: "ania", password: "shop", except: [:index, :show]

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end
 
  def create
    @product = Product.new(params[:product].permit(:name, :info, :price, :category_id))
 
    if @product.save
      redirect_to @product
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
      redirect_to @product
    else
      render 'edit'
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to products_path
  end

	private
  	
  def product_params
    params.require(:product).permit(:name, :info, :price, :category_id)
  end

end
