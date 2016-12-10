module SchedulesHelper
	
  ACTION_OPTIONS = ["DayOff","Sick leave","Few hours off","Overtime"]

  def show_hours hours 
  	if hours == 0 || hours.nil?
  	  val = '/'
  	else 
       val = hours
    end
  end
end
