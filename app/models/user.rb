class User < ApplicationRecord
  belongs_to :company
  has_many :schedules, dependent: :destroy	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :is_current_user?, -> (top_user_id, user) {		
	if top_user_id == user.id
	  true
	else
	  false
	end
  }

  def top_overtime_user(current_user)

    isTop = false

    top_user_id = User.find_top_overtime_user

    isTop = User.is_current_user?(top_user_id, current_user)

  end

  def self.find_top_overtime_user
  	top_user_id = 0
  	top_overtime = 0

  	users = User.all
    users.each do |user| 

      schedules = Schedule.where(user_id: user.id, action: 'Overtime')

      total_overtime = Schedule.count_total_overtime(schedules)
      
      top_user_id, top_overtime = compare(top_overtime, total_overtime, user)

    end 

    top_user_id
  end

  def self.compare(top_overtime,total_overtime, user)

    if total_overtime > top_overtime
      	top_overtime = total_overtime
      	top_user_id = user.id
	end 

	return top_user_id, top_overtime
  end

end
