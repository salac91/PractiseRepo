require 'rails_helper'

RSpec.describe "schedules/index", type: :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        :action => "Action",
        :hours => 2.5,
        :company_id => 3
      ),
      Schedule.create!(
        :action => "Action",
        :hours => 2.5,
        :company_id => 3
      )
    ])
  end

  it "renders a list of schedules" do
    render
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
