require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
            :name => "hava",
            }
  end

  it "should create a user with name" do
    User.create!(@attr)
  end

  it "should require a name" do
    user = User.new()
    user.should_not be_valid
  end

end
