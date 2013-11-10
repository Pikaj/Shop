class Admin::ProductsController < AdminController

  require 'CreateProductService'

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end
 
  def create
    begin
      @product = create_product_service.process(params[:product])
      flash[:notice] = "Create new post success"
      redirect_to admin_product_path(@product)
    rescue CreateProductService::EmptyNameError
      flash[:notice] =  "Error: empty name"
      render 'admin/products/new'
    rescue CreateProductService::EmptyPriceError
      flash[:notice] =  "Error: empty price"
      render 'admin/products/new'
    rescue CreateProductService::FailedPriceError
      flash[:notice] =  "Incorrect format price"
      render 'admin/products/new'
    rescue CreateProductService::NoCategoryError
      flash[:notice] = "Please select the category."
      render 'admin/products/new'
    rescue CreateProductService::EmptyInfoError
      flash[:notice] =  "Error: empty information"
      render 'admin/products/new'
    rescue CreateProductService::SaveProductError
      flash[:notice] = "Failed to save post"
      render 'admin/products/new'
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

  def create_product_service
    CreateProductService.new()
  end
end
