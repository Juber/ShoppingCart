require 'fastercsv'

def load_test_data
   delete_old_data
   load_movies
   load_categories
   load_products
end

def delete_old_data 
  puts "delete old data"
  Movie.delete_all
  Product.delete_all
  Category.delete_all
end

def load_movies
   FasterCSV.foreach("#{RAILS_ROOT}/db/load/movies.csv") do |row|
   Movie.create! :title => row[0], :rating => row[1]
   puts "Movies loaded successfully"
     
   end
end



def load_categories
   FasterCSV.foreach("#{RAILS_ROOT}/db/load/categories.csv") do |row|
   Category.create! :name => row[0]   
 end
  puts "Categories loaded successfully"
end


def load_products
  
   FasterCSV.foreach("#{RAILS_ROOT}/db/load/products.csv") do |row|   
   Product.create! :title => row[0], :description => row[1], :price => row[2], 
   :image_url => row[3], :category_id => row[4]
 end
 puts "Products loaded successfully"
end




