class User < ApplicationRecord
  belongs_to :company
  has_many :schedules, dependent: :destroy	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def top_overtime_user?

    top_user_id = User.find_top_overtime_user

    isTop = User.is_current_user?(top_user_id, self.id)

  end

  def overused_sick_leave?
		overused = false

		schedules = Schedule.user_year_schedules(self.id)

		count = User.count_sick_leave(schedules)

		overused = User.is_overused?(count)
  end

  def self.count_sick_leave(schedules)
      count = 0

	  schedules.each do |schedule|
        if Schedule.action_sick_leave?(schedule.action)
  		  count += 1 
  		end
      end

      count
  end 

  def self.is_overused?(count)
    if count > 4
      overused = true 
    else 
      overused = false
    end
  end

  def self.find_top_overtime_user
  	top_user_id = -1
  	top_overtime = 0

  	users = User.all
    users.each do |user| 

      schedules = Schedule.where(user_id: user.id, action: 'Overtime')

      total_overtime = Schedule.count_total_overtime(schedules)
      
      top_user_id, top_overtime = self.compare(top_overtime, 
      	total_overtime, top_user_id, user)

    end 

    top_user_id
  end

  def self.compare(top_overtime,total_overtime, top_user_id, user)
    top_user_id_temp = top_user_id
  	top_overtime_temp = top_overtime

    if total_overtime > top_overtime
      	top_overtime_temp = total_overtime
      	top_user_id_temp = user.id
	end 

	return top_user_id_temp, top_overtime_temp
  end

  def self.is_current_user?(top_user_id, user_id) 	
	if top_user_id == user_id
	  true
	else
	  false
	end
  end

end
