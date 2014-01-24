class PeopleController < ApplicationController
  def index
    # remember the domain name selected
    @email_domain = params[:email_domain] || 'All'

    # get all people matching a domain name
    @people = Person.find_all_with_email_domain @email_domain

    # get all the available domain names
    @email_domains = Person.all_email_domains
    
  end
end
