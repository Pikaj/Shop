class Product < ActiveRecord::Base
	belongs_to :category

	validates :name, presence: true,
                    length: { minimum: 2 }
    
    validates :info, presence: true,
                    length: { minimum: 5 }
                    

    validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }

end
