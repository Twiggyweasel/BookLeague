require 'rails_helper'

RSpec.describe "Club::Meetings", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/club/meetings/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/club/meetings/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/club/meetings/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/club/meetings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/club/meetings/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /udpate" do
    it "returns http success" do
      get "/club/meetings/udpate"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/club/meetings/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
