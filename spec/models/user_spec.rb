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
 	let!(:schedule) { create(:schedule, hours: 2) }  
    context "executes methods correctly" do
      context "top_overtime?" do
        it "top_overtime? does what it's supposed to..." do
          expect(user.top_overtime?).to eq(true) 
     	end
      end

      context "overused_sick_leave?" do
        it "overused_sick_leave? does what it's supposed to..." do
          expect(user.overused_sick_leave?).to eq(false)
     	end
      end

    end
 end   

end
