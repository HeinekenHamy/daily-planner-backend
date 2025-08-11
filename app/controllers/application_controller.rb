class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    decoded = JsonWebToken.decode(token)
    @current_user = User.find(decoded[:user_id])
  rescue ActiveRecord::RecordNotFound, StandardError => e
    render json: { error: e.message }, status: :unauthorized
  end
end
