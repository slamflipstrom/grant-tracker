require 'rails_helper'

RSpec.describe "Controllers", :type => :request do
  describe "GET /controllers" do
    it "works! (now write some real specs)" do
      get controllers_path
      expect(response.status).to be(200)
    end
  end
end
