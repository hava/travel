class HolidaysController < ApplicationController
  def index
    @holidays = Holiday.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @holiday = Holiday.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end

  def create
    @user = User.find(1)
    @holiday = @user.holidays.new(params[:holiday])

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to(holidays_url) }
    end
  end
end
