require 'rails_helper'

RSpec.describe Listing, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it 'is invalid without a name, price, and description' do
  	listing = Listing.new
  	listing.should_not be_valid
  end

	it "changes the number of listings" do
		listing = Listing.new(name: "couch for sale", price: 9.99, description: "This is a couch for sale")
		expect {listing.save}.to change {Listing.count}.by(1)
	end

	it "should be within the same class of a listing" do
		listing = Listing.new(name: "couch for sale", price: 9.99, description: "This is a couch for sale")
		listing.should_not be_an_instance_of(String)
	end

end



