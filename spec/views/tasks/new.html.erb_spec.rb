require 'rails_helper'

RSpec.describe "tasks/new", :type => :view do
  before(:each) do
    assign(:task, Task.new(
      :description => "MyString",
      :due_date => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_due_date[name=?]", "task[due_date]"

      assert_select "input#task_name[name=?]", "task[name]"
    end
  end
end
