class ProductsController < ApplicationController
  #before_filter :login_required
  layout 'layout'
  
  def index
    @products = Product.product_for_sale
  end
  
  
  
end
