class SessionsController < ApplicationController

  def new
  end

  def create
    # Find user by email
    user = User.find_by_username(session_params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    # Delete user_id from the browser cookie and this way
    # they can be logged out of the website
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

    def session_params
      params.require(:user).permit(:username, :password)
    end

end
