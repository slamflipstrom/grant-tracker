require 'rails_helper'

RSpec.describe "grants/index", :type => :view do
  before(:each) do
    assign(:grants, [
      Grant.create!(
        :name => "Name"
      ),
      Grant.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of grants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
