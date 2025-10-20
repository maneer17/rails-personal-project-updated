require "jwt"
class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base
  ALGORITHM = "HS256"
  def self.genereate_token(payload, exp = Time.now.to_i + 3600*2)
    payload[:exp]= exp
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def self.decode_token(token)
    body = JWT.decode(token, SECRET_KEY, ALGORITHM)
    HashWithIndifferentAccess.new body[0]
  end
end
