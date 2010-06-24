require 'spec_helper'

describe "holidays/new.html.erb" do
  before(:each) do
    assign(:holiday, stub_model(Holiday,
      :new_record? => true,
      :name => "MyString",
      :from_date => Date.new(y=2010, m=6, d=26),
      :to_date => Date.new(y=2010, m=6, d=26)
    ))
  end

  it "renders new holiday form" do
    render

    rendered.should have_selector("form", :action => holidays_path, :method => "post") do |form|
      form.should have_selector("input#holiday_name", :name => "holiday[name]")
      form.should have_selector("select#holiday_from_date_1i", :name => "holiday[from_date(1i)]")
      form.should have_selector("select#holiday_to_date_1i", :name => "holiday[to_date(1i)]")
     
    end
  end
end
