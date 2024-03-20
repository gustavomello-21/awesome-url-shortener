class UrlsController < ApplicationController

  before_action :load_params

  def generate_short_url
    url_params = {
      url: params[:url],
      token: GenerateUrlToken.new.generate_token(params[:url])
    }

    url = Url.create(url_params)

    render json: { url: "http://localhost:3000/#{url.token}" }, status: :created
  end

  def redirect_to_original_url
    url = Url.find_by(token: params[:token])

    if url
      render json: { url: url.url }, status: :ok
    else
      render json: {message: "Url não encontrada" }, status: :not_found
    end
  end

  def load_params
    params.permit(:url)
  end
end
