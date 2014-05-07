class Comment < ActiveRecord::Base
  validates :commenter, :Product_id, :presence => true
  belongs_to :Product
end
