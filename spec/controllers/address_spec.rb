require 'spec_helper'
require 'rails_helper'


# this will tell me if any addres exist 
describe Address, type: :model do
	let(:address) { Address.new }
	context "Address model exist ?" do
		it "return if model address exist" do
			expect(address).to be_valid
		end
	end

    #look if all the attributes are there
	context "attributes exist" do
		it "return false if not" do
			address.should respond_to(:id, :type_of_address, :status, :number_and_street, :entity, :suite_or_appartment, :city, :postal_code, :country, :latitude, :longitude )
		end
	end
end