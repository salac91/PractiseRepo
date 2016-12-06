require 'rails_helper'

RSpec.describe Company, type: :model do

  it 'company is valid' do
    expect(build_stubbed(:company)).to be_valid
  end

  it 'company is invalid' do
    expect(build_stubbed(:company, name: nil)).to_not be_valid
  end

  #check association with shoulda 
  it { should have_many(:schedules) }

end
