class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])
    if user
      session[:current_user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete :current_user_id
    redirect_to root_url, notice: "Logged out!"
  end
end
