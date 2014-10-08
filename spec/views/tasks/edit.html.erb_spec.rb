require 'rails_helper'

RSpec.describe "tasks/edit", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :description => "MyString",
      :due_date => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_due_date[name=?]", "task[due_date]"

      assert_select "input#task_name[name=?]", "task[name]"
    end
  end
end
