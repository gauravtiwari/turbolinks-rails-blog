class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user
    return if current_user
    respond_to do |format|
      format.html {redirect_to '/login', status: :unauthorized}
      format.js {render :js => "window.location = '/login'", status: :unauthorized}
    end
  end

  private

    def user_not_authorized
      render json: {
        url: request.referrer || root_path,
        message: 'You are not authorized to perform this action. Redirecting...',
      }, status: :unauthorized
    end

end
