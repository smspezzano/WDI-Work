class Url < ActiveRecord::Base
 	self.primary_key = "random_string"  
 	# validates: :link, :presence => true, :link, :uniqueness => true
end
