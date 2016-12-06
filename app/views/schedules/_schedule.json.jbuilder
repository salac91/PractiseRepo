json.extract! schedule, :id, :action, :hours, :date, :company_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)