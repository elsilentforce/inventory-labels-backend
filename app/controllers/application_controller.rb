class ApplicationController < ActionController::API
  before_action :authorize

  def authorize
    render json: { message: 'Please log in' }, status: :unauthorized unless valid_token?
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.jwt[:secret])
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def valid_token?
    if auth_header
      token = auth_header.split(' ').second
      begin
        JWT.decode(token, Rails.application.credentials.jwt[:secret], true, algorithm: Rails.application.credentials.jwt[:algorithm])
        return true
      rescue JWT::DecodeError
        Rails.logger.warn "Error decoding the JWT: #{ e.to_s }"
        return false
      else
        return false
      end
    end
  end

end
