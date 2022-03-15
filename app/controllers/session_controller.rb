class SessionController < ApplicationController

  def new
  end

  def create
    # login authentication
    user = User.authenticate_with_credentials(user_params[:email], user_params[:password])
    if (user)
      session[:user_id] = user.id
      redirect_to '/'
    else
      # Redirects users to the login form on failure.
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end