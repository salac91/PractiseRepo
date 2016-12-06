require 'rails_helper'

RSpec.describe "schedules/edit", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :action => "MyString",
      :hours => 1.5,
      :company_id => 1
    ))
  end

  it "renders the edit schedule form" do
    render

    assert_select "form[action=?][method=?]", schedule_path(@schedule), "post" do

      assert_select "input#schedule_action[name=?]", "schedule[action]"

      assert_select "input#schedule_hours[name=?]", "schedule[hours]"

      assert_select "input#schedule_company_id[name=?]", "schedule[company_id]"
    end
  end
end
