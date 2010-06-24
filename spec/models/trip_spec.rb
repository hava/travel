require 'spec_helper'
require 'factories'

describe Trip do
  before(:each) do
    @user = Factory(:user)
    @attr = {:name => "Vancouver",
             :from_date => Date.new(y=2010, m=6, d=26),
             :to_date => Date.new(y=2010, m=7, d=3)}
  end

  it "should create a trip" do
    @user.trips.create!(@attr)
  end

  it "should not create a trip with invalid name" do
    trip = @user.trips.create(@attr.merge(:name => nil))
    trip.should_not be_valid
  end

  it "should not create a trip with invalid dates" do
    trip = @user.trips.create(@attr.merge(:from_date=>Date.new(y=2010, m=7, d=4)))
    trip.should_not be_valid
  end

end
