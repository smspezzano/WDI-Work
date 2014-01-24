class Person < ActiveRecord::Base
	def self.all_email_domains
		#let's get all distinct domain names
		# returns an array domain names
		# use map, b/c we are returned an array of person objects
		# need to go to an array for names, which are strings
		select(:domain_name).distinct.map do |person|
			person.domain_name
		end
	end

	def self.find_all_with_email_domain email_domain=nil
		return [] if email_domain == nil
		return all if email_domain == 'All'
		where('domain_name = ?', email_domain)
	end
end
