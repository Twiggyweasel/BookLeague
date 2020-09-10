require 'rails_helper'

RSpec.describe "Clubs", type: :request do
  subject(:club) { create(:club) }

  describe "GET /index" do
    it "returns http success" do
      get "/clubs"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/clubs/#{subject.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new," do
    it "returns http success" do
      get "/clubs/new"
      expect(response).to have_http_status(:success)
    end
  end



  describe "GET /edit" do
    it "returns http success" do
      get "/clubs/#{subject.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
