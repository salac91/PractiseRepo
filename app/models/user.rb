class User < ApplicationRecord
  belongs_to :company
  has_many :schedules, dependent: :destroy	
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :year_sick_leave, -> (user_id) { 
    Schedule.where("created_at > ? AND created_at < ? AND user_id = ? 
      AND action = 'Sick leave'", Time.now.beginning_of_year, Time.now.end_of_year, user_id)
     .count
  }

  scope :top_overtime, -> { 
      joins(:schedules)
     .select("users.*, count(schedules.action == 'Overtime') as ocount")
     .group("users.id")
     .order("ocount DESC")
     .first
  }

  def top_overtime?
    User.top_overtime.id == self.id
  end

  def overused_sick_leave?
	  User.year_sick_leave(self.id) > 4
  end

end
