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

 describe "public methods" do
 	let!(:user) { create(:user) }
 	let!(:user2) { create(:user, email: 'pera@gmail.com') }  

    let!(:schedules) { create_list(:schedule, 10, 
    	action: 'Sick leave', hours: 0, user: user2) }

    context "executes methods correctly" do
      context "top_overtime?" do
        it "when is top" do
          expect(user2.top_overtime?).to eq(true) 
     	end
     	it "when is not top" do
          expect(user.top_overtime?).to eq(false) 
     	end
      end

      context "overused_sick_leave?" do
        it "when is overused" do    
          expect(user2.overused_sick_leave?).to eq(true) 
     	end
     	it "when is not overused" do    
          expect(user.overused_sick_leave?).to eq(false)
     	end
      end

    end
 end   

end
