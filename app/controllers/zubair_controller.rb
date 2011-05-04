class ZubairController < ApplicationController
  
  
  
  before_filter :login_required
  
  def index
    @products = Product.salable_items
    @cart = find_cart
  end

  def add_to_cart
    begin
     product = Product.find(params[:id])
    
    rescue ActiveRecord::RecordNotFound
       logger.error("Attempt to access invalid product #{params[:id]}" )
       redirect_to_index("Invalid product" )
    else
      @cart = find_cart
      @item = @cart.add_product(product)
       respond_to do |format|
       format.js if request.xhr?
        format.html {redirect_to_index}
      end
    end
  end


  def display_cart
    @cart = find_cart
    @items = @cart.items
    if @items.empty?
      redirect_to_index("Your cart is currently empty")
    end
      
    if params[:context] == :checkout
      render(:layout => false)
    end

  end

 def empty_cart
   session[:cart]= nil
   redirect_to_index
 end
  
  def checkout
    @cart = find_cart
    @items = @cart.items
    if @items.empty?          
      redirect_to_index("There's nothing in your cart!")
    else
      @order = Order.new
    end
  end
  
  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    @order.save
    if @order.save
     session[:cart] = nil
     redirect_to_index("Thank you for your order" )
  else
   render :action => :checkout
 end
 end

private    
  def find_cart
    session[:cart] ||= Shopping.new
  end
  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to(:action => 'index')
  end
  


end


