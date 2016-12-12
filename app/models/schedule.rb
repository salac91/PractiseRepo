class Schedule < ApplicationRecord
	belongs_to :user

	validates :action, presence: true
	validates :date, presence: true
	validates :user_id, presence: true, numericality: true

	before_save :increase_overtime

	scope :monthly_overtimes, -> { where("created_at > ? AND created_at < ? AND action = 'Overtime' ", 
		  Time.now.beginning_of_month, Time.now.end_of_month)
	}

	def self.monthly_total_overtime
      monthly_overtimes.map(&:hours).sum
	end

	private 
	
	def increase_overtime 
	  self.hours *= 1.5 if self.action == 'Overtime'
	end  

end
