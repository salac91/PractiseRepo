require 'rails_helper'

RSpec.describe Schedule, type: :model do

  it 'schedule is valid' do
    expect(build_stubbed(:schedule)).to be_valid
  end

  it 'schedule with no action is invalid' do
    expect(build_stubbed(:schedule, action: nil)).to_not be_valid
  end

  it 'schedule with no date is invalid' do
    expect(build_stubbed(:schedule, date: nil)).to_not be_valid
  end

  it 'schedule with wrong date format is invalid' do
    expect(build_stubbed(:schedule, date: "032-02-2015")).to_not be_valid
  end

  it 'schedule with no user is invalid' do
    expect(build_stubbed(:schedule, user_id: nil)).to_not be_valid
  end

  #check association with shoulda 
  it { should belong_to(:user) }


 describe "public methods" do
    let!(:schedule) { create(:schedule, hours: 2) }
    let!(:schedule2) { 
    	create(:schedule, hours: 3, 
    	user: create(:user, email: 'pera@gmail.com') ) 
    }         
    context "executes method correctly" do 
      context "monthly_total_overtime" do
        it "monthly_total_overtime does what it's supposed to..." do
          expect(Schedule.monthly_total_overtime).to eq(7.5)
          expect(Schedule.monthly_total_overtime).to_not eq(6)
     	end
      end
    end

  end
end
