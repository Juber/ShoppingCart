logo = "#{RAILS_ROOT}/public/images/java.jpg"

pdf.repeat :all do
  pdf.image logo

end



pdf.text "Product: #{@products.title}", :size => 10, :spacing => 16
pdf.text "Description: #{@products.description}",  :size => 10, :spacing => 16
pdf.text "Price: $#{@products.price}"

