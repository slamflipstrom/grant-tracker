require 'rails_helper'

RSpec.describe "tasks/index", :type => :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :description => "Description",
        :due_date => "Due Date",
        :name => "Name"
      ),
      Task.create!(
        :description => "Description",
        :due_date => "Due Date",
        :name => "Name"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Due Date".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
