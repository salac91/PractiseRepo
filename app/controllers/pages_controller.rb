class PagesController < ApplicationController
  def index
  	if user_signed_in?
  	  @top_overtime_user = User.new.top_overtime_user(current_user)
  	  @sickleave_overused = Schedule.overused_sick_leave?(current_user)
  	end
  end
end