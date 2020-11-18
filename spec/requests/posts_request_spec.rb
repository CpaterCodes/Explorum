require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /posts" do
    it "Responds with status 200" do
      get "/posts/"
      expect(response).to have_http_status(200)
    end


  end

  describe "GET /posts/new" do
    it "Responds with status 200" do
      get "/posts/new"
      expect(response).to have_http_status(200)
    end
  end

end
