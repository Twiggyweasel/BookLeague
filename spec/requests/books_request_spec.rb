require 'rails_helper'

RSpec.describe "Books", type: :request do
  subject(:book) { create(:book) }
  
  describe "GET /index" do
    it "returns http success" do
      get "/books"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/books/#{subject.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/books/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/books/#{subject.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
