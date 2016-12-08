class Schedule < ApplicationRecord
	belongs_to :user

	validates :action, presence: true
	validates :date, presence: true
	validates :user_id, presence: true, numericality: true

	ACTION_OPTIONS = ["DayOff","Sick leave","Few hours off","Overtime"]

	before_create :update_overtime

	def update_overtime 
		self.hours += self.hours * 0.5 if self.action == "Overtime"
	end

	def self.montly_total_overtime

		total_overtime = 0

		schedules = where("created_at > ? AND created_at < ?", 
		  Time.now.beginning_of_month, Time.now.end_of_month)

		schedules.each do |schedule|
  		  total_overtime += schedule.hours if schedule.action == 'Overtime'
        end

        total_overtime
	end

	def self.overused_sick_leave?(currentUser)
		overused = false

		schedules = where("created_at > ? AND created_at < ? AND user_id = ?", 
	      Time.now.beginning_of_year, Time.now.end_of_year, currentUser.id)

		count = 0
		schedules.each do |schedule|
  		  count += 1 if schedule.action == 'Sick leave'
        end

        if count > 4
          overused = true 
    	end

		overused

	end
end
