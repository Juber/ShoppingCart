class LineItem < ActiveRecord::Base
  
   belongs_to :product
   belongs_to :order


  def self.for_product(product)
    item = self.new         
    item.quantity = 1
    item.product = product
    item.unit_price = product.price
    item
  end
  
  def self.from_cart_item(cart_item)
    li = self.new
    li.product = cart_item.product
    li.quantity = cart_item.quantity
    li.unit_price = cart_item.unit_price
    li
  end

end
