class Schedule < ApplicationRecord
	belongs_to :company

	validates :action, presence: true
	validates :date, presence: true
	validates :company_id, presence: true, numericality: true

	ACTION_OPTIONS = ["DayOff","Sick leave","Few hours off","Overtime"]
end
