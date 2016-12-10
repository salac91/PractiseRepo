class SchedulesController < ApplicationController

  # GET /schedules
  def index
    @schedules = Schedule.where(user_id: current_user.id)
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @user = current_user
    @schedule.user_id = @user.id
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    redirect_to user_schedules_path(current_user.id), notice: 'Schedule was successfully created.'
  end

  def summary 
    @total_overtime = Schedule.monthly_total_overtime
  end 

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:action, :hours, :date, :user_id)
    end
end
