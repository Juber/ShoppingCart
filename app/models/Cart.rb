class Cart
    attr_reader :items

    def initialize
       @items = []
    end
    
    def add_product(product)
       @items << product  
      
      item = @items.find {|i| i.product == product.id}
      
      if item
        puts "************************* #{item}"
      end
      
    end
  
end