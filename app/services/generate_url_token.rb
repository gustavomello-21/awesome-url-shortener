require 'digest'

class GenerateUrlToken
  def generate_token(url)
    token_input = "#{url}#{Time.now.to_i}#{rand}"
    token = Digest::SHA256.hexdigest(token_input)
    token[0..5]
  end
end
