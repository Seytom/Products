class Product < ActiveRecord::Base
	validates :category_id, :presence => true
	
	
	belongs_to :category
	has_many :comments
end
