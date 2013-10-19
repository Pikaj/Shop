class Category < ActiveRecord::Base
	
   	validates :category, presence: true,
                    length: { minimum: 1 }
                    
end
