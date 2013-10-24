class SessionController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.where(email: email).first
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to '/search'
    else
      flash.now.alert = "invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out"
  end

end