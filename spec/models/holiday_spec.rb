require 'spec_helper'

describe Holiday do
  before(:each) do
    @attr = {
            :name => "Vancouver",
            :from_date => Date.new(y=2010, m=6, d=26),
            :to_date => Date.new(y=2010, m=7, d=3)
    }
  end

  it "should create a new instance given valid attributes" do
    Holiday.create!(@attr)
  end

  it "should not create if name is invalid" do
    holiday = Holiday.new(@attr.merge(:name=>nil))
    holiday.should_not be_valid
  end

  it "from date must be before to date" do
    holiday = Holiday.new(@attr.merge(:from_date=>Date.new(y=2010, m=7, d=4)))
    holiday.should_not be_valid
  end
end
