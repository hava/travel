require "spec_helper"

describe HolidaysController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/holidays" }.should route_to(:controller => "holidays", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/holidays/new" }.should route_to(:controller => "holidays", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/holidays/1" }.should route_to(:controller => "holidays", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/holidays/1/edit" }.should route_to(:controller => "holidays", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/holidays" }.should route_to(:controller => "holidays", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/holidays/1" }.should route_to(:controller => "holidays", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/holidays/1" }.should route_to(:controller => "holidays", :action => "destroy", :id => "1") 
    end

  end
end
