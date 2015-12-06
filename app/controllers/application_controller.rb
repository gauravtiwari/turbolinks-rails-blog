class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user, :user_signed_in?

  def authenticate_user
    return if current_user
    render json: {
      url: request.referrer || root_path,
      message: 'You are not authorized to perform this action. Redirecting...',
    }, status: :unauthorized
  end

  def user_signed_in?
    return false unless session[:user_id].present?
    User.where(id: session[:user_id]).exists?
  end

  private

  def user_not_authorized
    render json: {
      url: request.referrer || root_path,
      message: 'You are not authorized to perform this action. Redirecting...',
    }, status: :unauthorized
  end

end
