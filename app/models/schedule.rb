class Schedule < ApplicationRecord
	belongs_to :user

	validates :action, presence: true
	validates :date, presence: true
	validates :user_id, presence: true, numericality: true

	ACTION_OPTIONS = ["DayOff","Sick leave","Few hours off","Overtime"]

	before_create :update_overtime

	def update_overtime 
		if action_overtime?(self.action) 
		  self.hours += self.hours * 0.5 
		end
	end

	scope :monthly_schedules, -> { where("created_at > ? AND created_at < ?", 
		  Time.now.beginning_of_month, Time.now.end_of_month)
	}

	scope :user_year_schedules, -> (user_id) { where("created_at > ? AND created_at < ? AND user_id = ?", 
	      Time.now.beginning_of_year, Time.now.end_of_year, user_id)
	}

	scope :count_total_overtime, -> (schedules) {		
		total_overtime = 0

		schedules.each do |schedule|
		  if action_overtime?(schedule.action) 
  		    total_overtime += schedule.hours 
  		  end
  		end

  		total_overtime
	}

	def self.montly_total_overtime

		schedules = monthly_schedules

  		total_overtime = count_total_overtime(schedules)
	end

	def self.overused_sick_leave?(user)
		overused = false

		schedules = user_year_schedules(user.id)

		count = count_sick_leave(schedules)

		overused = sick_leave_overused?(count)
	end

	def self.action_overtime?(action)
      if(action == 'Overtime')
      	true
      else 
      	false
      end
	end

	def self.action_sick_leave?(action)
      if(action == 'Overtime')
      	true
      else 
      	false
      end
	end

	def self.count_sick_leave(schedules)
      count = 0

	  schedules.each do |schedule|
        if action_sick_leave?(schedule.action)
  		  count += 1 
  		end
      end

      count
	end 

	def self.sick_leave_overused?(count)
	  overused = false

      if count > 4
          overused = true 
      end

      overused
	end
end
