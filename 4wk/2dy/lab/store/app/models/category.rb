class Category < ActiveRecord::Base
	has_many :inventories
	has_many :products, through: :inventories

	before_create {|category| category.name.downcase!}

	validates :name, presence: true
	
end
