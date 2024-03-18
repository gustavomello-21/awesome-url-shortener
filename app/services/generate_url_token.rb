require 'securerandom'

class GenerateUrlToken
  def generate_token(url)
    token = SecureRandom.hex(4) + DateTime.now.strftime("%Y%m%d%H%M%S") + url[0..2]
    token
  end
end
