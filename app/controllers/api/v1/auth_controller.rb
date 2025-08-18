class Api::V1::AuthController < ApplicationController
  def register
    puts "DEBUG PARAMS: #{params.inspect}"
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token:, user: UserBlueprint.render_as_hash(user) }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_content
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token:, user: UserBlueprint.render_as_hash(user) }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:auth).permit(:email, :password, :password_confirmation)
  end
end
