class Tenant
  #basic properties, feel free to add more
  attr_accessor :name, :phone, :unit

  # initialize instance variables
  def initialize(name, phone, unit)
    #implement
    @name = name
    @phone = phone
    @unit = unit
  end

  # Returns the tenant's contact info (name and phone) as one string
  def contact_info
    #implement
    # puts "Would you like to see ALL tenants or a specific tenants"
    # res = gets.chomp
    # if res == "all"
    puts   "The tenant's name is #{@name}, phone number is #{@phone}, and unit is #{unit}"
  end

end
