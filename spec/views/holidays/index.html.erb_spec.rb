require 'spec_helper'

describe "holidays/index.html.erb" do
  before(:each) do
    assign(:holidays, [
      stub_model(Holiday,
        :name => "MyString1",
        :from_date =>  Date.new(y=2010, m=6, d=26),
        :to_date => Date.new(y=2010, m=7, d=26)
      ),
      stub_model(Holiday,
        :name => "MyString2",
        :from_date =>  Date.new(y=2010, m=6, d=26),
        :to_date =>  Date.new(y=2010, m=7, d=26)
      )
    ])
  end

  it "renders a list of holidays" do
    render
    rendered.should have_selector("tr>td", :content => "MyString1".to_s)
    rendered.should have_selector("tr>td", :content => "MyString2".to_s)
  end
end
