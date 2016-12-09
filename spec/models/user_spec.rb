require 'rails_helper'

RSpec.describe User, type: :model do

  it 'user is valid' do
    expect(build_stubbed(:user)).to be_valid
  end

  it 'user with no email is invalid' do
    expect(build_stubbed(:user, email: nil)).to_not be_valid
  end

  it 'user with no password is invalid' do
    expect(build_stubbed(:user, password: nil)).to_not be_valid
  end

  #check association with shoulda 
  it { should belong_to(:company) }

 let(:schedules) { [build_stubbed(:schedule, action: 'Sick leave'), 
 	build_stubbed(:schedule, action: 'Sick leave')] }

 describe "public methods" do

    context "executes methods correctly" do
      context "top_overtime_user?" do
        it "top_overtime_user does what it's supposed to..." do
          expect(build_stubbed(:user).top_overtime_user?).to eq(false)
     	end
      end

      context "overused_sick_leave?" do
        it "overused_sick_leave does what it's supposed to..." do
          expect(build_stubbed(:user).overused_sick_leave?).to eq(false)
     	end
      end

      context "count_sick_leave" do
        it "count_sick_leave does what it's supposed to..." do
          expect(User.count_sick_leave(schedules)).to eq(2)
     	end
      end

      context "is_overused" do
        it "is_overused does what it's supposed to..." do
          expect(User.is_overused?(6)).to eq(true)
     	end
      end

    end
 end   


end
