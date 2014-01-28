# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null
#  link          :string(255)
#  random_string :string(255)      primary key
#  count         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Url < ActiveRecord::Base
 	self.primary_key = "random_string"  
 	# validates: :link, :presence => true, :link, :uniqueness => true
end
