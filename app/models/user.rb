class User < ApplicationRecord
  #belongs_to :company
  has_many :schedules, dependent: :destroy	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.top_overtime_user(currentUser)
    users = User.all

    top_overtime = 0
    top_user_id = 0
    isTop = false

    users.each do |user| 

      schedules = Schedule.where(user_id: user.id, action: 'Overtime')

      total_overtime = 0

      schedules.each do |schedule|
        total_overtime += schedule.hours
      end

      if total_overtime > top_overtime
      	top_overtime = total_overtime
      	top_user_id = user.id
	  end 

    end 

    isTop = true if top_user_id == currentUser.id

    isTop 
  end

end
