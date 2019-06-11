class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private

  def user_not_authorized
    render json: { status: :error, code: "UNAUTHORIZED_ACCESS", message: "Você não está autorizado a executar essa ação." }, status: :unauthorized
  end
end
