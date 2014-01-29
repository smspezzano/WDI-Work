class Product < ActiveRecord::Base
	has_many :inventories
	has_many :categories, through: :inventories

	before_create {|product| product.name.downcase!}

	validates :name, presence: true
	
end
