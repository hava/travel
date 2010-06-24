require 'spec_helper'

describe "holidays/show.html.erb" do
  before(:each) do
    @holiday = assign(:holiday, stub_model(Holiday,
      :name => "MyString",
      :from_date => "MyString",
      :to_date => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("MyString")
    rendered.should contain("MyString")
    rendered.should contain("MyString")
  end
end
