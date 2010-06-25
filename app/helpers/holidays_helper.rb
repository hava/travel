module HolidaysHelper

  def create_menu
    {:link=> new_holiday_path, :title=>"Create a Holiday"}
  end

  def list_menu
    {:link=> holidays_path, :title=>"Show all Holidays"}
  end

  def edit_menu
    {:link =>edit_holiday_path(params[:id]), :title=>"Edit this Holiday"}
  end


  def view_properties
    action = params[:action]
    if (action == "index")
      {:heading => "Holidays", :sidepanel =>[create_menu]}
    elsif (action == "new" || action == "create")
      {:heading => "Create a Holiday", :sidepanel =>[list_menu]}
    elsif (action == "edit"|| action == "update")
      {:heading => @holiday.name, :sidepanel =>[create_menu, list_menu]}
    elsif (action == "show")
      {:heading => @holiday.name, :sidepanel =>[edit_menu, create_menu, list_menu]}
    end
  end
end
