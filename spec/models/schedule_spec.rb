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

let(:schedules) { [build_stubbed(:schedule, hours: 2), 
 	build_stubbed(:schedule, hours: 6)] }

 describe "public methods" do

    context "executes methods correctly" do 
      context "monthly_total_overtime" do
        it "monthly_total_overtime does what it's supposed to..." do
          expect(Schedule.monthly_total_overtime).to eq(8)
     	end
      end
    end

  end
end
