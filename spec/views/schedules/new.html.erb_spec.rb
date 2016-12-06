require 'rails_helper'

RSpec.describe "schedules/new", type: :view do
  before(:each) do
    assign(:schedule, Schedule.new(
      :action => "MyString",
      :hours => 1.5,
      :company_id => 1
    ))
  end

  it "renders new schedule form" do
    render

    assert_select "form[action=?][method=?]", schedules_path, "post" do

      assert_select "input#schedule_action[name=?]", "schedule[action]"

      assert_select "input#schedule_hours[name=?]", "schedule[hours]"

      assert_select "input#schedule_company_id[name=?]", "schedule[company_id]"
    end
  end
end
