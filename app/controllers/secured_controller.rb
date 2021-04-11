class SecuredController < ApplicationController
  before_action :authorize_request

  private

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end

# adds a before_action call, so every request will pass through AuthorizationService before running any additional handlers
# also handles returning a 401 Unauthorized response if the request doesn't pass muster