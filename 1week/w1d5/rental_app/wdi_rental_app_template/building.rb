class Building 
  attr_accessor :name, :address, :units

  # initialize instance variables
  def initialize(name, address, units = [])
    @name = name
    @address = address
    @units = []
  end

  # Returns an array. Each element is a tenant's contact info
  def get_contact_list
    #implement
    contact_info
  end

  # Returns the total sqft rented.
  def calc_total_sqft_rented
    #implement

  end

  # Returns the annual income. Only rented units make income.
  def calc_annual_income
    #implement
  end

  # Returns an array containing all available units
  def get_available_units
    #implement
  end

  # Returns an array containing all occupied units
  def get_rented_units
    #implement
  end

end
