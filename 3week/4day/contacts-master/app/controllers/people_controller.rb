class PeopleController < ApplicationController
  def index
    # remember the domain name selected
    @email_domain = params[:email_domain] || 'All'

    # get all people
    @people = Person.all

    # get all the available domain names
    @email_domains = @people.map { |p| p.email.split('@').last }.uniq.sort

    # filter the people based on domain name, when provided
    @people.to_a.select! { |p| p.email.index @email_domain } unless @email_domain == 'All'
  end
end
