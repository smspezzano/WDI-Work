# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base

	before_create {|user| user.email.downcase!}
	before_create :create_remember_token
	
	before_save :create_remember_token
  
 	has_secure_password

 	validates :name, presence: true, length: { maximum: 50 }
 	validates :email, presence: true, uniqueness: { case_sensitve: false}
 	validates :password, presence: true, lengt: { minimum: 6 }, confirmation: true
 	validates :password_confirmation, presence: true


 	private

    	def create_remember_token
        	self.remember_token = SecureRandom.urlsafe_base64
    	end 
end
