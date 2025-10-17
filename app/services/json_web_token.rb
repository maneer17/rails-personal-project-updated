require "jwt"
class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base
  ALGORITHM = "HS256"
  def self.genereate_token(payload)
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def self.decode_token(token)
    JWT.decode(token, SECRET_KEY, ALGORITHM)
  end
end
