module JsonWebToken

  def encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decode(token)
    raw = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    HashWithIndifferentAccess.new(raw)
  rescue
    nil 
  end

  module_function :encode, :decode

end
