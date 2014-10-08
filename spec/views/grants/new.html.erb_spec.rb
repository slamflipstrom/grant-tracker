require 'rails_helper'

RSpec.describe "grants/new", :type => :view do
  before(:each) do
    assign(:grant, Grant.new(
      :name => "MyString"
    ))
  end

  it "renders new grant form" do
    render

    assert_select "form[action=?][method=?]", grants_path, "post" do

      assert_select "input#grant_name[name=?]", "grant[name]"
    end
  end
end
