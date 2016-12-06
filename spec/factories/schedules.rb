FactoryGirl.define do 
	factory :schedule do 
		action 'Overtime'
		hours 4
		date '02-04-2016'	
		company
	end
end