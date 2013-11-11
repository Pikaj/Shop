class CreateProductService
  class EmptyNameError < StandardError; end
  class EmptyPriceError < StandardError; end
  class FailedPriceError < StandardError; end
  class NoCategoryError< StandardError; end
  class EmptyInfoError < StandardError; end
  class SaveProductError < StandardError; end

  def process(product, params)
    raise EmptyNameError.new unless !params[:name].empty?
    raise EmptyPriceError.new unless !params[:price].empty?
    raise FailedPriceError.new unless correct_price?(params[:price])
    raise NoCategoryError.new unless !params[:category_id].empty?
    raise EmptyInfoError.new unless !params[:info].empty?

    render 'new' if !product.save
    raise SaveProductError.new unless product.save
  end 

  def correct_price?(price)
    #/\A\d{1,4}(\.\d{0,2})?\z/ 
    true
  end
end