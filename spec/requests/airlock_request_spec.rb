require 'rails_helper'

RSpec.describe "Airlocks", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/airlock/index"
      expect(response).to have_http_status(:success)
    end
  end

end
