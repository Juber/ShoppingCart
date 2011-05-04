class CategoriesController < ApplicationController
  
  before_filter :login_required 
   
  def index
  @categories=Category.find(:all)
end

def show
  @categories=Category.find(params[:id])
  puts "-------------------------------------"
  puts "#{@categories.name}"
  puts "#{params[:id]}"
  puts "--------------------------------------"
  category_id= params[:id]
  @products=Product.find(:all, :conditions => "category_id=  #{category_id} ")
end


def add_to_cart
     @cart = find_cart
     
     category_id= params[:id]
      prod = Product.find(category_id)
      @cart.add_product(prod) 
 end
 
 
 #private
  
  def find_cart
    session[:cart] ||= Cart.new    
  end

  
 
end

