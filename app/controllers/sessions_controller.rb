class SessionsController < ApplicationController

  skip_before_action :authenticate_request

  def create
    action = AuthenticateUserService.call(
      email: params[:email],
      password: params[:password]
    )

    if action.success?
      render json: { auth_token: action.result }
    else
      render json: { error: action.errors.messages }, status: :unauthorized
    end
  end

end
