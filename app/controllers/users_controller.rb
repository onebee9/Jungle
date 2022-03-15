class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # user credentials must pass validations before saving
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # if users sign up credentials don't meet validation, send them back to sign up page
      redirect_to '/signup'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private 

   # Using callbacks to share common constraints between actions.
   def set_user
    @user = User.find(params[:id])
  end

  # validating input data.
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
    end
end