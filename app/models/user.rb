class User < ApplicationRecord
  belongs_to :company
  has_many :schedules, dependent: :destroy	
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def top_overtime?
     user = User.joins(:schedules)
     .select("users.*, count(schedules.action == 'Overtime') as ocount")
     .order("ocount DESC")
     .first
     user.id == self.id unless user.nil?
  end

  def overused_sick_leave?
	  User.joins(:schedules)
    .where("schedules.created_at > ? AND schedules.created_at < ? AND user_id = ? 
      AND action = 'Sick leave'", Time.now.beginning_of_year, Time.now.end_of_year, self.id)
    .count > 4
  end

end
