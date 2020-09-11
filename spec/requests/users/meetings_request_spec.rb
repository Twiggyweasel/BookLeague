require 'rails_helper'

RSpec.describe "Users::Meetings", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/users/meetings/index"
      expect(response).to have_http_status(:success)
    end
  end

end
