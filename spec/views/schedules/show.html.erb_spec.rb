require 'rails_helper'

RSpec.describe "schedules/show", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :action => "Action",
      :hours => 2.5,
      :company_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Action/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
  end
end
