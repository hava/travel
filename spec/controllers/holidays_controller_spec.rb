require 'spec_helper'

describe HolidaysController do

  def mock_holiday(stubs={})
    @mock_holiday ||= mock_model(Holiday, stubs).as_null_object
  end

  def mock_user(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all holidays as @holidays" do
      Holiday.stub(:all) { [mock_holiday] }
      get :index
      assigns(:holidays).should eq([mock_holiday])
    end
  end

  describe "GET show" do
    it "assigns the requested holiday as @holiday" do
      Holiday.stub(:find).with("37") { mock_holiday }
      get :show, :id => "37"
      assigns(:holiday).should be(mock_holiday)
    end
  end

  describe "GET new" do
    it "assigns a new holiday as @holiday" do
      Holiday.stub(:new) { mock_holiday }
      get :new
      assigns(:holiday).should be(mock_holiday)
    end
  end

  describe "GET edit" do
    it "assigns the requested holiday as @holiday" do
      Holiday.stub(:find).with("37") { mock_holiday }
      get :edit, :id => "37"
      assigns(:holiday).should be(mock_holiday)
    end
  end

  describe "POST create" do

    before(:each) do
      User.stub(:find).with(1){@user}
      @user.stub(:holidays){Holiday}
    end

    describe "with valid params" do
      it "assigns a newly created holiday as @holiday" do
        Holiday.stub(:new).with({'these' => 'params'}) { mock_holiday(:save => true) }
        post :create, :holiday => {'these' => 'params'}
        assigns(:holiday).should be(mock_holiday)
      end

      it "redirects to the created holiday" do
        Holiday.stub(:new) { mock_holiday(:save => true) }
        post :create, :holiday => {}
        response.should redirect_to(holiday_url(mock_holiday))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved holiday as @holiday" do
        Holiday.stub(:new).with({'these' => 'params'}) { mock_holiday(:save => false) }
        post :create, :holiday => {'these' => 'params'}
        assigns(:holiday).should be(mock_holiday)
      end

      it "re-renders the 'new' template" do
        Holiday.stub(:new) { mock_holiday(:save => false) }
        post :create, :holiday => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested holiday" do
        Holiday.should_receive(:find).with("37") { mock_holiday }
        mock_holiday.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :holiday => {'these' => 'params'}
      end

      it "assigns the requested holiday as @holiday" do
        Holiday.stub(:find) { mock_holiday(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:holiday).should be(mock_holiday)
      end

      it "redirects to the holiday" do
        Holiday.stub(:find) { mock_holiday(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(holiday_url(mock_holiday))
      end
    end

    describe "with invalid params" do
      it "assigns the holiday as @holiday" do
        Holiday.stub(:find) { mock_holiday(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:holiday).should be(mock_holiday)
      end

      it "re-renders the 'edit' template" do
        Holiday.stub(:find) { mock_holiday(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested holiday" do
      Holiday.should_receive(:find).with("37") { mock_holiday }
      mock_holiday.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the holidays list" do
      Holiday.stub(:find) { mock_holiday(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(holidays_url)
    end
  end

end
