require 'employee'
require 'spec_helper'

describe Employee do 

  # this will break all because of the 'it "can change name" function'
  # also creates new employees BEFORE each test, not what we want
  before(:each) do 
	@employee = Employee.new("Spencer", "Web Developer")
	@employee1 = Employee.new("Michael", "Web Developer")
  end

	it "has a name" do
		@employee.name.should eq("Spencer")
	end

	# this is BAD because we are making this test dependent on other tests and vis-versa
	it "can change name" do
		@employee.name = "Spezzano"
		@employee.name.should eq("Spezzano")
	end

	it "introduces itself" do
		@employee.introduce.should eq("Hi my name is Spencer")
	end

	it "updates employee count" do
		Employee.count.should eq(2)
	end

	it "say title" do
		@employee.title.should eq("My title is Web Developer")
		@employee1.title.should eq("My title is Web Developer")
	end

  after(:each) do
  	Employee.resign
  	Employee.resign
  end
end
