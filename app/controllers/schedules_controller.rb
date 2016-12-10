class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  def index
    @schedules = Schedule.where(user_id: current_user.id)
  end

  # GET /schedules/1
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @user = current_user
    @schedule.user_id = @user.id
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    redirect_to user_schedules_path(current_user.id), notice: 'Schedule was successfully created.'
  end

  # PATCH/PUT /schedules/1
  def update
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
    redirect_to company_path(@schedule.company_id)
  end

  def summary 
    @total_overtime = Schedule.monthly_total_overtime
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:action, :hours, :date, :user_id)
    end
end
