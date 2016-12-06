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

  it 'schedule with no company is invalid' do
    expect(build_stubbed(:schedule, company_id: nil)).to_not be_valid
  end

  #check association with shoulda 
  it { should belong_to(:company) }

end