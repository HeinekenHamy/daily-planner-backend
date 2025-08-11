class Api::V1::ProtectedTestController < ApplicationController
  before_action :authorize_request

  def index
    render json: { message: "Welcome #{@current_user.email}!" }
  end
end
