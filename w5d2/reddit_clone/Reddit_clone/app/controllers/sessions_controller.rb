class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_credentials(params[:user][:name], param[:user][:password])
    if @user.save
      login(@user)
      # redirect_to post_url
    else
      flash[:errors] = @user.errors.full_messages
      # redirect_to
      render :new
    end
  end

  def destroy
    # @user = User.find(params[:id])
    logout
    redirect_to new_session_url
    # @user =
  end
end
