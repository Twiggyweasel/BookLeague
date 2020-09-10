require 'rails_helper'

RSpec.describe "Clubs", type: :request do

  describe "GET /index," do
    it "returns http success" do
      get "/clubs/index,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show," do
    it "returns http success" do
      get "/clubs/show,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new," do
    it "returns http success" do
      get "/clubs/new,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create," do
    it "returns http success" do
      get "/clubs/create,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit," do
    it "returns http success" do
      get "/clubs/edit,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update," do
    it "returns http success" do
      get "/clubs/update,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/clubs/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
