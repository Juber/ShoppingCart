class Product < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :title
  validates_numericality_of :price
  validates_format_of :image_url,  :with => %r{\.(gif|jpg|png)$}i,
 :message => "must be a URL for a GIF, JPG, or PNG image"
 
 
  def self.salable_items
    find(:all,:order      => 'id')
  end

 
  def self.product_for_sale
    puts "*******************************"
    puts "FIND method"
    puts "*******************************"
 q= Product.find(:all , :order => 'title')

  end
end
