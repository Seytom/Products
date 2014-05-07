class Product < ActiveRecord::Base
	validates :category, :presence => true
	
	belongs_to :category
	has_many :comments
end
