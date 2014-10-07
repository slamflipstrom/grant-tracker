require 'rails_helper'

RSpec.describe "controllers/index", :type => :view do
  before(:each) do
    assign(:controllers, [
      Controller.create!(
        :user => "User"
      ),
      Controller.create!(
        :user => "User"
      )
    ])
  end

  it "renders a list of controllers" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
