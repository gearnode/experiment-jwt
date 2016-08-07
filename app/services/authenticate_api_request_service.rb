class AuthenticateApiRequestService < ApplicationService

  def initialize(headers:)
    @headers = headers
  end

  def call
    decode_token
    retrieve_user
  end

  private

  def decode_token
    @decoded_token = JsonWebToken.decode(http_auth_header)
  end

  def retrieve_user
    if @decoded_token 
      @user = User.find(@decoded_token[:user_id])
    else
      errors.add(:token, 'Invalid token')
      nil
    end
  end

  def http_auth_header
    if @headers['Authorization'].present?
      @headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
      nil
    end
  end

end
