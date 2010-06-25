class HolidaysController < ApplicationController
  def index
    @header = "Holidays"
    @holidays = Holiday.all
    @sidepanel = [{:link=> new_holiday_path, :title=>"Create a Holiday"}]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @holiday = Holiday.find(params[:id])
    @header = @holiday.name
    @sidepanel = [edit_menu(params[:id]),{:link=> new_holiday_path, :title=>"Create a Holiday"}, {:link=> holidays_path, :title=>"Show all Holidays"}]

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    new_holiday_setup()
    @holiday = Holiday.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @holiday = Holiday.find(params[:id])
    edit_holiday_setup(@holiday.name)
  end

  def create
    @user = User.find(1)
    @holiday = @user.holidays.new(params[:holiday])

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully created.') }
      else
        new_holiday_setup()
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @holiday = Holiday.find(params[:id])
    name = @holiday.name

    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully updated.') }
      else
        edit_holiday_setup(name)
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

  private
  def edit_menu(id)
     return {:link=> edit_holiday_path(id), :title=>"Edit this Holiday"}
  end

  def new_holiday_setup
    @header = "Create a Holiday"
    @sidepanel = [{:link=> holidays_path, :title=>"Show all Holidays"}]
  end

  def edit_holiday_setup(name)
    @header = name
    @sidepanel = [{:link=> new_holiday_path, :title=>"Create a Holiday"}, {:link=> holidays_path, :title=>"Show all Holidays"}]
  end
end
