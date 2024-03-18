require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "GET /generate_short_url" do
    it "returns http success" do
      get "/urls/generate_short_url"
      expect(response).to have_http_status(:success)
    end
  end

end
