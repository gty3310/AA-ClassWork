class SessionsController < ApplicationController

  before_action :require_logged_in, only: [:new]
  
  def new
    @user = User.new #just so we can use partial forms
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      # debugger
      login(@user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid username and password combo"]
      redirect_to new_session_url
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
    end

    session[:session_token] = nil
    redirect_to new_session_url
  end

end
