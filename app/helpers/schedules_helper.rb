module SchedulesHelper
  def show_hours hours 
  	if hours == 0 || hours.nil?
  	  val = '/'
  	else 
       val = hours
    end
  end
end
