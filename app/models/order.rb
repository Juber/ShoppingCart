class Order < ActiveRecord::Base
  
   has_many :line_items
   
    validates_presence_of :name
    validates_presence_of :address
    validates_presence_of :pay_type
     validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   
 PAYMENT_TYPES = [
# Displayed stored in db
[ "Check" , "check" ],
[ "Credit card" , "cc" ],
[ "Purchase order" , "po" ]
]
validates_presence_of :name, :address, :email, :pay_type
validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map {|disp, value| value}

  def add_line_items_from_cart(cart)
     cart.items.each do |item|
     li = LineItem.from_cart_item(item)
     line_items << li
   end
  end
end
