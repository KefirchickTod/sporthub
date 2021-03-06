require 'rails_helper'

RSpec.describe "Admin::Articles", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/admin/articles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/articles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/articles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admin/articles/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admin/articles/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
