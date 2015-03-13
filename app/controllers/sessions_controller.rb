class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_user(session_params)
    if @user.nil?
      flash.now[:errors] = ["Couldn't find username/password combo"]
      render :new
    else
      login_user!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    logout!
    redirect_to users_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
