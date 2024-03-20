require 'rails_helper'

RSpec.describe UrlsController do

  describe "#generate_short_url" do
    context "when url was passed" do
      let(:params) do
          {
            url: "www.google.com"
          }
        end
      it "returns url with token and status created" do
        get :generate_short_url, params: params

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['url']).to match(/http:\/\/localhost:3000\/\w+/)
      end
    end
  end

  describe "#redirect_to_original_url" do
    context "when token is valid" do
      let(:url) { Url.create(url: "www.google.com", token: "abc123") }
      it "returns orignal url" do
        get :redirect_to_original_url, params: { token: url.token }

        expect(JSON.parse(response.body)['url']).to eq(url.url)
        expect(response).to have_http_status(:ok)
      end
    end

    context "when token is invalid" do
      it "returns not found status" do
        get :redirect_to_original_url, params: { token: "invalid_token" }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
