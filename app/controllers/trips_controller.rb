class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def create
    @user = User.find(1)
    @trip = @user.trips.new(params[:trip])
    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end
end
