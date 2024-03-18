class UrlsController < ApplicationController

  before_action :load_params

  def generate_short_url
    url_params = {
      url: params[:url],
      token: Services::GenerateUrlToken.new.generate_token(params[:url])
    }

    Url.create(url_params)
  end

  def load_params
    params.permit(:url)
  end
end
