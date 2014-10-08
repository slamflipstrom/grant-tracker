require 'rails_helper'

RSpec.describe "tasks/show", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :description => "Description",
      :due_date => "Due Date",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Due Date/)
    expect(rendered).to match(/Name/)
  end
end
