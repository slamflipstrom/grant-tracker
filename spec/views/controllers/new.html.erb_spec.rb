require 'rails_helper'

RSpec.describe "controllers/new", :type => :view do
  before(:each) do
    assign(:controller, Controller.new(
      :user => "MyString"
    ))
  end

  it "renders new controller form" do
    render

    assert_select "form[action=?][method=?]", controllers_path, "post" do

      assert_select "input#controller_user[name=?]", "controller[user]"
    end
  end
end
