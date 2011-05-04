class Movie < ActiveRecord::Base
  
  belongs_to :user
 #validates_presence_of :title, :rating
 
 #validates_numaricality_of :rating , :greater_than_or_equal_to => 1 , :less_than_or_equal_to =>5
 
 
end
