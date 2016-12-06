class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :action
      t.float :hours
      t.date :date
      t.integer :company_id

      t.timestamps
    end
  end
end
