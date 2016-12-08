class AddUseIdToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :user_id, :integer
  end
end
