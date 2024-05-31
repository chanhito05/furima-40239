require 'rails_helper'
include Devise::Test::IntegrationHelpers

RSpec.describe "Articles", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get articles_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_article_path
      expect(response).to have_http_status(:success)
    end
  end
end
